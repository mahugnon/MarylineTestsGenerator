Extension { #name : #FamixPWBBehavioral }

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBBehavioral >> addedCharacter [
	addedCharacter ifNil: [ addedCharacter := 0 ].
	^ addedCharacter
]
