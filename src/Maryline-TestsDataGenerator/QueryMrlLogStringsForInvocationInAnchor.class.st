Class {
	#name : #QueryMrlLogStringsForInvocationInAnchor,
	#superclass : #MRLAbstractQuery,
	#classVars : [
		'identity'
	],
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #'instance creation' }
QueryMrlLogStringsForInvocationInAnchor class >> identity [
identity ifNil: [ identity := 0 ].
identity := identity +1.
^identity

]

{ #category : #'instance creation' }
QueryMrlLogStringsForInvocationInAnchor class >> resetIdentity [
identity =nil

]

{ #category : #'instance creation' }
QueryMrlLogStringsForInvocationInAnchor >> identity [
	^ self class identity asString
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> printInitalScriptOn: aString for: aFamixPWBInvocation [
	| result cleaninvocationText cleanSourceText |
	cleaninvocationText := aFamixPWBInvocation sourceText
		copyReplaceAll: '&' , String crlf
		with: ''.
	cleanSourceText := aString
		copyReplaceAll: aFamixPWBInvocation sourceText
		with: cleaninvocationText.
	(QueryInsertMrlCodeLines new
		runOn: cleanSourceText
		with: cleaninvocationText)
		do: [ :aLine | 
			| fullInvocationText |
			fullInvocationText := (MrlInvocationVisitor new lineText: aLine)
				visit
				detect:
					[ :text | text asLowercase includesSubstring: cleaninvocationText asLowercase ].
			result := cleanSourceText
				copyReplaceAll: aLine
				with:
					(String
						streamContents: [ :aStream | 
							aStream
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
	returnVar := 'lvar' , invocationLine , self identity , '_'
		, behavior name , '_return'.
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
				<< behavior name;
				<< '"';
				space;
				nextPut: $,;
				<< '"';
				<< behavior parentType name;
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
