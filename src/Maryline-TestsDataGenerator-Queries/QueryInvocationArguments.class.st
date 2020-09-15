Class {
	#name : #QueryInvocationArguments,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInvocationArguments >> argumentsFromInvocationSourceText: sourceText [
	| arguments |
	arguments := (PWBCommonParser new functionInvocation
		parse: sourceText trim) functionArguments functionArguments.
	arguments := arguments isEmptyOrNil
		ifFalse: [ self removeNumbers: arguments ].
	^ arguments
]

{ #category : #running }
QueryInvocationArguments >> ensureCandidatesUnicity: aFamixPWBInvocation [
	^ ((aFamixPWBInvocation candidates groupedBy: #parentType) values
		collect: #anyOne) anyOne
]

{ #category : #running }
QueryInvocationArguments >> invocationCleanSourceText: aFamixPWBInvocation [
	| sourceText |
	sourceText := ((PWBPreprocessor parse: aFamixPWBInvocation sourceText)
		copyReplaceAll: '.'
		with: '') copyReplaceAll: String tab with: ''.
	^ sourceText
]

{ #category : #running }
QueryInvocationArguments >> removeNumbers: arguments [
	^ arguments reject: [ :arg | arg isNumber ]
]

{ #category : #running }
QueryInvocationArguments >> runOn: aFamixPWBInvocation [
	| arguments sourceText candidateParameters candidate |
	candidate := self ensureCandidatesUnicity: aFamixPWBInvocation.
	candidateParameters := candidate setParameters parameters
		sortAscending: #startPos.
	sourceText := self invocationCleanSourceText: aFamixPWBInvocation.
	arguments := self argumentsFromInvocationSourceText: sourceText.
	^ (arguments isEmptyOrNil
		or: [ arguments size ~= candidateParameters size ])
		ifTrue: [ MRLQueryResults new ]
		ifFalse: [ arguments := arguments sortAscending: #startPosition.
			MRLQueryResults
				withAll:
					(arguments
						collect: [ :arg | 
							| invArg |
							invArg := MRLInvocationArgument new.
							invArg
								startPosition: arg startPosition;
								stopPosition: arg stopPosition;
								sender: aFamixPWBInvocation sender;
								invocationLineNumber: aFamixPWBInvocation sourceAnchor startLine;
								invocationText: aFamixPWBInvocation sourceText;
								receiver: candidate name;
								argumentValue: (sourceText copyFrom: arg startPosition to: arg stopPosition);
								argumentName: (candidateParameters at: (arguments indexOf: arg)) name ]) ]
]
