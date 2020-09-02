Extension { #name : #FamixPWBInvocation }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBInvocation >> insertMrlSetTimeStamp: aString [
	| result |
	(QueryInsertMrlCodeLines new runOn: aString with: self sourceText)
		do: [ :aLine | 
			result := aString
				copyReplaceAll: aLine
				with:
					(String
						streamContents: [ :aStream | 
							aStream
								<< 'f_mrl_logger().setTimestamp()';
								crlf;
								<< aLine ]) ].
	^ result
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBInvocation >> printInitalScriptOn: aString [
	| result |
	self halt.
	(QueryInsertMrlCodeLines new runOn: aString with: self sourceText)
		do: [ :aLine | 
			| fullInvocationText |
			fullInvocationText := (MrlInvocationVisitor new lineText: aLine)
				detect: [ :text | text includesSubstring: self sourceText ].
			result := aString
				copyReplaceAll: aLine
				with:
					(String
						streamContents: [ :aStream | 
							aStream
								<< 'f_mrl_logger().setTimestamp()';
								crlf;
								<< 'f_mrl_logger().return_value(';
								space;
								<< fullInvocationText;
								space;
								nextPut: $);
								crlf;
								<< aLine ]) ].
	^ result
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBInvocation >> printInitialPWBScript [
	| file beforeSenderText afterSenderText senderText initSize |
	file := sender sourceAnchor rootFolder asFileReference
		resolve: sender sourceAnchor fileName.
	beforeSenderText := file contents
		copyFrom: 1
		to: sender sourceAnchor startPos - 1.
	sender sourceAnchor endPos >= file contents size
		ifTrue: [ afterSenderText := '' ]
		ifFalse: [ afterSenderText := file contents
				copyFrom: sender sourceAnchor endPos + 1
				to: file contents size ].
	senderText := file contents
		copyFrom: sender sourceAnchor startPos
		to: sender sourceAnchor endPos.
	initSize := senderText size.
	senderText := self printInitalScriptOn: senderText.
	file
		writeStreamDo: [ :aStream | 
			aStream
				<< beforeSenderText;
				<< senderText;
				<< afterSenderText ].
	sender addedCharacter: senderText size - initSize.
	sender sourceAnchor
		endPos: sender sourceAnchor startPos + senderText size - 1
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBInvocation >> saveMrlLogStringsForArgumentsInAnchor [
	| mrlArguments |
	self printInitialPWBScript.
	mrlArguments := QueryInvocationArguments runOn: self.
	mrlArguments isEmptyOrNil
		ifFalse: [ mrlArguments do: #saveMrlLogStrings ]
]
