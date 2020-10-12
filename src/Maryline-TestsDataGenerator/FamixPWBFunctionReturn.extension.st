Extension { #name : #FamixPWBFunctionReturn }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBFunctionReturn >> insertLogIn: aString withParameters: aPWBParameterLogsString [
	| log fileContents textBefore textAfter addedCharacter |
	fileContents := self sourceAnchor completeText.
	addedCharacter := aString size - fileContents size.
	log := self prepareLogWith: aPWBParameterLogsString.
	(self isNotAlteredBefore: aString)
		ifTrue:
			[ textBefore := aString copyFrom: 1 to: self sourceAnchor startPos - 1.
			textAfter := aString
				copyFrom: self sourceAnchor endPos + 1
				to: aString size ]
		ifFalse: [ textBefore := aString
				copyFrom: 1
				to: self sourceAnchor startPos + addedCharacter - 1.
			textAfter := aString
				copyFrom: self sourceAnchor endPos + addedCharacter + 1
				to: aString size ].
	^ String
		streamContents: [ :stream | 
			stream
				<< textBefore;
				<< log;
				<< textAfter ]
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBFunctionReturn >> isNotAlteredBefore: aString [
	^ self sourceText
		=
			(aString
				copyFrom: self sourceAnchor startPos
				to: self sourceAnchor endPos)
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBFunctionReturn >> prepareLogWith: aPWBParameterLogsString [
	| log |
	log := aPWBParameterLogsString
		, 'f_mrl_logger().return_value_logger().log('
		, self returnValue asString , ',"' , behavioral name , '","'
		, behavioral parentType name , '")' , String crlf , self sourceText.
	^ self doesBelongToSingleLineIfStatement
		ifTrue: [ String tab
				, (log copyReplaceAll: String crlf with: ';' , String tab) ]
		ifFalse: [ String crlf , log , String crlf ]
]
