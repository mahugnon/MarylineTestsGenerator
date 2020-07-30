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
	| arguments sourceText |
	sourceText := aFamixPWBInvocation sourceText
		copyReplaceAll: '.'
		with: ''.
	arguments := (PWBCommonParser new functionInvocation
		parse: sourceText) functionArguments functionArguments.
	arguments := self removeNumbers: arguments.
	^ arguments isEmptyOrNil
		ifTrue: [ MRLQueryResults new ]
		ifFalse: [ MRLQueryResults
				withAll:
					(arguments
						collect: [ :arg | 
							| invArg |
							invArg := MRLInvocationArgument new.
							invArg
								startPosition: arg startPosition;
								stopPosition: arg stopPosition;
								sender: aFamixPWBInvocation sender;
								invocationLineNumber: (sourceText lineNumberCorrespondingToIndex: arg startPosition);
								invocationText: aFamixPWBInvocation sourceText;
								receiver: aFamixPWBInvocation candidates anyOne name;
								argumentString: (sourceText copyFrom: arg startPosition to: arg stopPosition) ]) ]
]
