Extension { #name : #FamixPWBFunctionReturn }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBFunctionReturn >> isRelatedTo: aString [
	^ self behavioral name = aString
]
