Extension { #name : #FamixPWBFunctionReturn }

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBFunctionReturn >> isRelatedTo: aString [
	^ self behavioral name = aString
]
