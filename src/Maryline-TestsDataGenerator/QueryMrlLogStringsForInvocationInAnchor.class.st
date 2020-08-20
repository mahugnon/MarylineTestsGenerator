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
								<<
									(self
										returnValueString: aFamixPWBInvocation
										fulInvocationText: fullInvocationText);
								<< aLine ]) ].
	^ result
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> returnValueString: aFamixPWBInvocation fulInvocationText: aString [
	| returnType behavior returnVar invocationLine |
	behavior := aFamixPWBInvocation candidates anyOne.
	returnType := behavior returnType.
	invocationLine := aFamixPWBInvocation sourceAnchor startLine asString.
	returnType ifNil: [ ^ '' ].
	returnType isString
		ifFalse: [ returnType := returnType name ].
	returnVar := 'lvar' , Time current asSeconds asString
		, invocationLine , '_' , behavior name , '_return'.
	^ String
		streamContents: [ :stream | 
			stream
				<< returnType;
				space;
				<< returnVar;
				crlf;
				<< returnVar;
				space;
				<< '=';
				space;
				<< aString;
				crlf;
				<< 'f_mrl_logger().return_value(';
				space;
				<< returnVar;
				nextPut: $,;
				space;
				<< invocationLine;
				space;
				nextPut: $,;
				<< '"';
				<< aFamixPWBInvocation candidates anyOne name;
				<< '"';
				space;
				nextPut: $);
				crlf ]
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
