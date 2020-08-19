Class {
	#name : #QueryMrlLogStringsForInvocationInAnchor,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> printInitalScriptOn: aString for: aFamixPWBInvocation [
	| result |
	(QueryInsertMrlCodeLines new
		runOn: aString
		with: aFamixPWBInvocation sourceText)
		do: [ :aLine | 
			| fullInvocationText |
			fullInvocationText := (MrlInvocationVisitor new lineText: aLine)
				visit
				detect: [ :text | text includesSubstring: aFamixPWBInvocation sourceText ].
			result := aString
				copyReplaceAll: aLine
				with:
					(String
						streamContents: [ :aStream | 
							aStream
								<< 'f_mrl_logger().setTimestamp()';
								crlf;
								<< 'f_mrl_logger().return_value(';
								space;
								<< fullInvocationText;
								space;
								nextPut: $);
								crlf;
								<< aLine ]) ].
	^ result
]

{ #category : #running }
QueryMrlLogStringsForInvocationInAnchor >> runOn: aFamixPWBInvocation with: aString [
	^ self
		printInitalScriptOn:
			(QueryMrlLogStringsForArgumentsWithAnchorText new
				runOn: (QueryInvocationArguments runOn: aFamixPWBInvocation)
				with: aString)
		for: aFamixPWBInvocation
]
