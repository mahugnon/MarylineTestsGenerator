Extension { #name : #FamixPWBBehavioral }

{ #category : #'*Maryline' }
FamixPWBBehavioral >> saveMrlLogStringsForInvocationsInAnchor [
	self outgoingInvocations
		select: [ :inv | 
			inv candidates
				anySatisfy: [ :candidate | candidate parentType isNotNil ] ]
		thenDo: [ :inv | inv saveMrlLogStringsForArgumentsInAnchor ]
]
