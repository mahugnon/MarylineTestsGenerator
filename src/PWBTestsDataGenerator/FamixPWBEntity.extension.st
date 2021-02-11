Extension { #name : #FamixPWBEntity }

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBEntity >> getBusinessRuleFunctions [
	^ (self mooseModel getBusinessRuleFunctions at: self ifAbsent: {})
		reject: [ :each | each isLogged ]
]
