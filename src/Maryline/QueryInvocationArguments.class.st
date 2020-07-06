Class {
	#name : #QueryInvocationArguments,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-Queries'
}

{ #category : #running }
QueryInvocationArguments >> runOn: aFamixPWBInvocation [
	| arguments sourceText |
	sourceText := aFamixPWBInvocation sourceText.
	arguments := (PWBCommonParser new functionInvocation
		parse: sourceText) functionArguments functionArguments
		collect: [ :arg | 
			| invArg |
			invArg := MRLInvocationArgument new.
			invArg
				startPosition: arg startPosition;
				stopPosition: arg stopPosition;
				sender: aFamixPWBInvocation sender;
				receiver: aFamixPWBInvocation candidates anyOne name;
				argumentString: (sourceText copyFrom: arg startPosition to: arg stopPosition) ].
	^ MRLQueryResults withAll: arguments
]
