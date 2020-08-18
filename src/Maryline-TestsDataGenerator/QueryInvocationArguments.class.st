Class {
	#name : #QueryInvocationArguments,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInvocationArguments >> removeNumbers: arguments [
	^ arguments reject: [ :arg | arg isNumber ]
]

{ #category : #running }
QueryInvocationArguments >> runOn: aFamixPWBInvocation [
	| arguments sourceText candidateParameters |
	candidateParameters := aFamixPWBInvocation candidates anyOne
		setParameters parameters sortAscending: #startPos.
	sourceText := aFamixPWBInvocation sourceText
		copyReplaceAll: '.'
		with: ''.
	arguments := (PWBCommonParser new functionInvocation
		parse: sourceText) functionArguments functionArguments.
	arguments := arguments isEmptyOrNil
		ifFalse: [ self removeNumbers: arguments ].
	^ arguments isEmptyOrNil
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
								invocationLineNumber:
									(invArg file contents
										lineNumberCorrespondingToIndex: aFamixPWBInvocation sourceAnchor startPos);
								invocationText: aFamixPWBInvocation sourceText;
								receiver: aFamixPWBInvocation candidates anyOne name;
								argumentString: (candidateParameters at: (arguments indexOf: arg)) name ]) ]
]
