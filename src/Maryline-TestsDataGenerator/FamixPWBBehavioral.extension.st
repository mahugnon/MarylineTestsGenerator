Extension { #name : #FamixPWBBehavioral }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> addedCharacter [
	addedCharacter ifNil: [ addedCharacter := 0 ].
	^ addedCharacter
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> addedCharacter: anInteger [
	self addedCharacter.
	addedCharacter := addedCharacter + anInteger
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertParametersBeforeLog [
	| signature logs |
	signature := self sourceText lines first.
	self setParameters.
	logs := String
		streamContents:
			[ :stream | self parameters do: [ :param | param logOn: stream context: 'before' ] ].
	^ String
		streamContents: [ :stream | 
			(signature includesSubstring: '/*')
				ifTrue: [ stream
						<< (signature copyReplaceAll: '/*' with: '');
						crlf;
						<< logs;
						crlf;
						<< '/*';
						crlf ]
				ifFalse: [ stream
						<< signature;
						crlf;
						<< logs;
						crlf ].
			stream << (self sourceText copyReplaceAll: signature with: '') ]
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertReturnLogIn: aString [
	| result |
	result := aString.
	self returns
		ifEmpty: [ result := aString ]
		ifNotEmpty:
			[ self returns do: [ :return | result := return insertLogIn: result ] ].
	^ result
]

{ #category : #'*Maryline-TestsDataGenerator' }
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
