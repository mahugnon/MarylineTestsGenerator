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

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> cleanText: aFamixPWBInvocation [
	^ self
		reduceSpace:
			(self
				removeTab:
					(self
						removeCarriageReturn:
							(self
								removeEspelette: (PWBPreprocessor parse: aFamixPWBInvocation sourceText))))
]

{ #category : #'instance creation' }
QueryMrlLogStringsForInvocationInAnchor >> identity [
	^ self class identity asString
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> printInitalScriptOn: aString for: aFamixPWBInvocation [
	| result cleaninvocationText cleanSourceText lines |
	cleaninvocationText := self cleanText: aFamixPWBInvocation.
	cleanSourceText := aString
		copyReplaceAll: aFamixPWBInvocation sourceText
		with: cleaninvocationText.
	lines := QueryInsertMrlCodeLines new
		runOn: cleanSourceText
		with: cleaninvocationText.
	lines ifEmpty: [ ^ aString ].
	lines
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

{ #category : #'as yet unclassified' }
QueryMrlLogStringsForInvocationInAnchor >> reduceSpace: aString [
	^ aString replaceAllRegex: '\s+' with: ' '
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> removeCarriageReturn: aString [
	^ aString copyReplaceAll: String crlf with: ''
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> removeEspelette: aString [
	^ aString copyReplaceAll: '&' with: ''
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInAnchor >> removeTab: aString [
	^ aString copyReplaceAll: String tab with: ''
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
	(aFamixPWBInvocation candidates
		anySatisfy: [ :each | self toSkypeForNow includes: each name ])
		ifTrue: [ ^ aString ].
	^ self
		printInitalScriptOn:
			(QueryMrlLogStringsForArgumentsWithAnchorText new
				runOn: (QueryInvocationArguments runOn: aFamixPWBInvocation)
				with: aString)
		for: aFamixPWBInvocation
]

{ #category : #'as yet unclassified' }
QueryMrlLogStringsForInvocationInAnchor >> toSkypeForNow [
^{'of_copystream'. 'f_decimal'. 'f_videsinull'}
]
