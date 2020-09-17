Class {
	#name : #QueryMrlLogStringsForInvocationInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #printing }
QueryMrlLogStringsForInvocationInSource >> cleanText: aFamixPWBInvocation [
	^ self
		reduceSpace:
			(self
				removeTab:
					(self
						removeCarriageReturn:
							(self
								removeEspelette: (PWBPreprocessor parse: aFamixPWBInvocation sourceText))))
]

{ #category : #'as yet unclassified' }
QueryMrlLogStringsForInvocationInSource >> invocationCandidateAcces: aFamixPWBInvocation [
	^ (aFamixPWBInvocation candidates anyOne accesses
		select: #isInstanceVariableAccess)
		collect: [ :var | var asMrlArgument ]
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInSource >> printInitalScriptOn: aString for: aFamixPWBInvocation [
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
									(QueryMrlAccessesLogStringsForInvocationInSource new
										runOn: aFamixPWBInvocation
										with:
											(QueryMrlReturnValueLogStringsForInvocationInSource new
												runOn: aFamixPWBInvocation
												with: fullInvocationText));
								<< aLine ]) ].
	^ result
]

{ #category : #'as yet unclassified' }
QueryMrlLogStringsForInvocationInSource >> reduceSpace: aString [
	^ aString replaceAllRegex: '\s+' with: ' '
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInSource >> removeCarriageReturn: aString [
	^ aString copyReplaceAll: String crlf with: ''
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInSource >> removeEspelette: aString [
	^ aString copyReplaceAll: '&' with: ''
]

{ #category : #printing }
QueryMrlLogStringsForInvocationInSource >> removeTab: aString [
	^ aString copyReplaceAll: String tab with: ''
]

{ #category : #running }
QueryMrlLogStringsForInvocationInSource >> runOn: aFamixPWBInvocation with: aString [
	| arguments |
	(aFamixPWBInvocation candidates
		anySatisfy: [ :each | self toSkypeForNow includes: each name ])
		ifTrue: [ ^ aString ].
	arguments := QueryInvocationArguments runOn: aFamixPWBInvocation.
	"arguments
		addAll: (self invocationCandidateAcces: aFamixPWBInvocation)."
	^ self
		printInitalScriptOn:
			(QueryMrlLogStringsForArgumentsInSource new
				runOn: arguments
				with: aString)
		for: aFamixPWBInvocation
]

{ #category : #'as yet unclassified' }
QueryMrlLogStringsForInvocationInSource >> toSkypeForNow [
^{'of_copystream'. 'f_decimal'. 'f_videsinull'}
]
