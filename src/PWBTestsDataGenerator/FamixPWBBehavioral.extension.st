Extension { #name : #FamixPWBBehavioral }

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBBehavioral >> addedCharacter [
	addedCharacter ifNil: [ addedCharacter := 0 ].
	^ addedCharacter
]

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBBehavioral >> isLogged [
	^ self attributeAt: #logState ifAbsent: [ false ]
]

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBBehavioral >> logged [
	self attributeAt: #logState ifAbsentPut: true
]
