Extension { #name : #FamixPWBAccess }

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBAccess >> isRelatedTo: aString [
	^ self accessor name = aString
]
