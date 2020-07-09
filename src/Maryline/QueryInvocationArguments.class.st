Class {
	#name : #QueryInvocationArguments,
	#superclass : #MRLAbstractQuery,
	#instVars : [
		'alterFile'
	],
	#category : #'Maryline-Queries'
}

{ #category : #accessing }
QueryInvocationArguments >> alterFile [
	^ alterFile
]

{ #category : #accessing }
QueryInvocationArguments >> alterFile: anObject [
	alterFile := anObject
]

{ #category : #running }
QueryInvocationArguments >> runOn: aFamixPWBInvocation [
	| arguments sourceText |
	sourceText := aFamixPWBInvocation sourceText
		copyReplaceAll: '.'
		with: ''.
	arguments := (PWBCommonParser new functionInvocation
		parse: sourceText) functionArguments functionArguments.
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
								invocationText: aFamixPWBInvocation sourceText;
								receiver: aFamixPWBInvocation candidates anyOne name;
								argumentString: (sourceText copyFrom: arg startPosition to: arg stopPosition) ]) ]
]
