Extension { #name : #FamixPWBAccess }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBAccess >> isRelatedTo: aString [
	^ self accessor name = aString
]
