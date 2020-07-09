Extension { #name : #FamixPWBBehavioral }

{ #category : #'*Maryline' }
FamixPWBBehavioral >> addedCharacter [
	addedCharacter ifNil: [ addedCharacter := 0 ].
	^ addedCharacter
]

{ #category : #'*Maryline' }
FamixPWBBehavioral >> addedCharacter: anInteger [
	self addedCharacter.
	addedCharacter := addedCharacter + anInteger
]

{ #category : #'*Maryline' }
FamixPWBBehavioral >> saveMrlLogStringsForInvocationsInAnchor [
	((((self outgoingInvocations
		select: [ :inv | 
			inv candidates
				anySatisfy: [ :candidate | candidate parentType isNotNil ] ])
		sortAscending: [ :each | each sourceAnchor startPos ])
		groupedBy: #sourceText) values collect: [ :e | e first ])
		do: [ :inv | 
			inv sourceAnchor
				startPos: inv sourceAnchor startPos + self addedCharacter.
			inv sourceAnchor
				endPos: inv sourceAnchor endPos + self addedCharacter.
			inv saveMrlLogStringsForArgumentsInAnchor ]
]
