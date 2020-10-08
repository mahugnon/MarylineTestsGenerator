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
FamixPWBBehavioral >> insertAfterLogOfParametersAccessesWithReturnLogIn: aString [
	| result parametersWithAccesLog |
	parametersWithAccesLog := (self
		logOfVariables: self parameters
		with: 'after')
		, (self logOfVariables: self accessedAttributes with: 'after').
	result := aString.
	self returns
		ifEmpty: [ result := self
				insertAfterLogsOfVariables: self parameters
				beforeLastLigneIn: aString ]
		ifNotEmpty: [ self returns
				do: [ :return | 
					result := return
						insertLogIn: result
						withParameters: parametersWithAccesLog ] ].
	^ result
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertAfterLogsOfVariables: aCollection beforeLastLigneIn: aString [
	| lastLine newSourceCode |
	self flag: #NotWorking.
	lastLine := self sourceText lines last.
	newSourceCode := self sourceText
		copyReplaceAll: lastLine
		with:
			(self logOfVariables: aCollection with: 'after') , String crlf
				, lastLine.
	^ aString copyReplaceAll: self sourceText with: newSourceCode
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertAfterLogsOfVariables: aCollection withReturnLogIn: aString [
	| result |
	result := aString.
	self returns
		ifEmpty: [ result := self
				insertAfterLogsOfVariables: aCollection
				beforeLastLigneIn: aString ]
		ifNotEmpty: [ self returns
				do: [ :return | 
					result := return
						insertLogIn: result
						withParameters: (self logOfVariables: aCollection with: 'after' ) ] ].
	^ result
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertBeforeLogsOfVariables: aCollection in: aString [
	| signatureText newSourceCode |
	signatureText := self signature sourceText.
	newSourceCode := String
		streamContents: [ :stream | 
			stream
				<< signatureText;
				crlf;
				<< (self logOfVariables: aCollection with: 'before' );
				crlf.
			stream << (self sourceText copyReplaceAll: signatureText with: '') ].
	^ aString copyReplaceAll: self signature sourceText with: newSourceCode
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertMarylineLogIn: aString [
	^ "self
		insertAfterLogOfParametersAccessesWithReturnLogIn:"
			(self
				insertBeforeLogsOfVariables: self accessedAttributes
				in: (self insertBeforeLogsOfVariables: self parameters in: aString))
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertParametersBeforeLogIn: aString [
	| signatureText newSourceCode |
	signatureText := self signature sourceText.
	self setParameters.
	newSourceCode := String
		streamContents: [ :stream | 
			stream
				<< signatureText;
				crlf;
				<< (self logOfVariables: self parameters with: 'before' );
				crlf.
			stream << (self sourceText copyReplaceAll: signatureText with: '') ].
	^ aString copyReplaceAll: self sourceText with: newSourceCode
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> logOfVariables: aCollection with: aContextString [
	^ String
		streamContents: [ :stream | 
			aCollection
				do:
					[ :aVariable | aVariable logOn: stream context: aContextString behavior: self ] ]
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
