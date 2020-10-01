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
FamixPWBBehavioral >> insertParameterAfterLogBeforeLastLigneIn: aString [
	| lastLine newSourceCode |
	lastLine := self sourceText lines last.
	newSourceCode := self sourceText
		copyReplaceAll: lastLine
		with: (self parameterLogs: 'after') , String crlf , lastLine.
	^ aString copyReplaceAll: self sourceText with: newSourceCode
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertParametersAfterWithReturnLogIn: aString [
	| result |
	result := aString.
	self returns
		ifEmpty:
			[ result := self insertParameterAfterLogBeforeLastLigneIn: aString ]
		ifNotEmpty: [ self returns
				do: [ :return | 
					result := return
						insertLogIn: result
						withParameters: (self parameterLogs: 'after') ] ].
	^ result
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertParametersBeforeLog [
	| signatureText logs |
	signatureText := self sourceText lines first.
	self setParameters.
	logs := self parameterLogs: 'before'.
	^ String
		streamContents: [ :stream | 
			(signatureText includesSubstring: '/*')
				ifTrue: [ stream
						<< (signatureText copyReplaceAll: '/*' with: '');
						crlf;
						<< logs;
						crlf;
						<< '/*';
						crlf ]
				ifFalse: [ stream
						<< signatureText;
						crlf;
						<< logs;
						crlf ].
			stream << (self sourceText copyReplaceAll: signatureText with: '') ]
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertParametersBeforeLogIn: aString [
	| signatureText newSourceCode |
	signatureText := self signature sourceText.
	self setParameters.
	newSourceCode := String
		streamContents: [ :stream | 
			(signatureText includesSubstring: '/*')
				ifTrue: [ stream
						<< (signatureText copyReplaceAll: '/*' with: '');
						crlf;
						<< (self parameterLogs: 'before');
						crlf;
						<< '/*';
						crlf ]
				ifFalse: [ stream
						<< signatureText;
						crlf;
						<< (self parameterLogs: 'before');
						crlf ].
			stream << (self sourceText copyReplaceAll: signatureText with: '') ].
	^ aString copyReplaceAll: self sourceText with: newSourceCode
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBBehavioral >> insertParametersWithReturnLogIn: aString [
	| textWithLogs |
	textWithLogs := aString.
	textWithLogs := self insertParametersBeforeLogIn: textWithLogs.
	textWithLogs := self
		insertParametersAfterWithReturnLogIn: textWithLogs.
	^ textWithLogs
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
FamixPWBBehavioral >> parameterLogs: aContextString [
	^ String
		streamContents: [ :stream | 
			self parameters
				do: [ :param | param logOn: stream context: aContextString ] ]
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
