Class {
	#name : #MRLInvocationArgument,
	#superclass : #Object,
	#instVars : [
		'sender',
		'receiver',
		'startPosition',
		'stopPosition',
		'invocationText',
		'argumentName',
		'argumentValue',
		'invocationLineNumber',
		'file'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
MRLInvocationArgument >> argumentName [
	^ argumentName
]

{ #category : #accessing }
MRLInvocationArgument >> argumentName: anObject [
	argumentName := anObject
]

{ #category : #accessing }
MRLInvocationArgument >> argumentValue [
	^ argumentValue
]

{ #category : #accessing }
MRLInvocationArgument >> argumentValue: anObject [
	argumentValue := anObject
]

{ #category : #accessing }
MRLInvocationArgument >> file [
	file
		ifNil: [ file := sender sourceAnchor rootFolder asFileReference
				resolve: sender sourceAnchor fileName ].
	^ file
]

{ #category : #api }
MRLInvocationArgument >> generateInSourceTextMrlLogStrings [
	| beforeSenderText afterSenderText senderText |
	self flag: #toRemove.
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
	senderText := self insertMrlLogStringsIn: senderText.
	^ String
		streamContents: [ :aStream | 
			aStream
				<< beforeSenderText;
				<< senderText;
				<< afterSenderText ]
]

{ #category : #api }
MRLInvocationArgument >> generateInSourceTextMrlLogStrings: aString [
	| newSenderText |
	newSenderText := aString copy.
	(self invocationLines: aString)
		do: [ :aLine | 
			| mrlString |
			mrlString := self mrlLogStringsFor: aLine.
			newSenderText := (newSenderText includesSubstring: mrlString)
				ifTrue: [ newSenderText copyReplaceAll: mrlString with: mrlString ]
				ifFalse: [ newSenderText copyReplaceAll: aLine with: mrlString ] ].
	^ newSenderText
]

{ #category : #api }
MRLInvocationArgument >> insertMrlLogStringsIn: aString [
	| result |
	(self invocationLines: aString)
		do: [ :aLine | 
			result := aString
				copyReplaceAll: aLine
				with: (self mrlLogStringsFor: aLine) ].
	^ result
]

{ #category : #accessing }
MRLInvocationArgument >> invocationLineNumber [
	^ invocationLineNumber
]

{ #category : #accessing }
MRLInvocationArgument >> invocationLineNumber: anObject [
	invocationLineNumber := anObject
]

{ #category : #api }
MRLInvocationArgument >> invocationLines: sourceText [
	^ QueryInsertMrlCodeLines new
		runOn: sourceText
		with: self invocationText
]

{ #category : #accessing }
MRLInvocationArgument >> invocationText [
	^ invocationText
]

{ #category : #accessing }
MRLInvocationArgument >> invocationText: anObject [
	invocationText := anObject
]

{ #category : #api }
MRLInvocationArgument >> mrlAfterLogString [
	^self mrlLogString: 'after'
]

{ #category : #api }
MRLInvocationArgument >> mrlBeforeLogString [
	^ self mrlLogString: 'before'
]

{ #category : #api }
MRLInvocationArgument >> mrlLogString: aString [
	| printable |
	printable := argumentName copy.
	self replacementMap keys
		select: [ :key | printable includesSubstring: key asString ]
		thenDo: [ :key | 
			printable := printable
				copyReplaceAll: key asString
				with: (self replacementMap at: key) ].
	^ String
		streamContents: [ :aStream | 
			aStream
				<< 'f_mrl_logger().invocation_parameter_logger().log(';
				<< argumentValue;
				<< ',';
				<< '"';
				<< sender name;
				<< '"';
				<< ',';
				<< '"';
				<< sender parentType name;
				<< '-';
				<< invocationLineNumber asString;
				<< '-';
				<< printable;
				<< '-';
				<< aString;
				<< '-';
				<< receiver;
				<< '"';
				<< ')' ]
]

{ #category : #api }
MRLInvocationArgument >> mrlLogStringsFor: aLine [
	^ String
		streamContents: [ :aStream | 
			aStream
				<< self mrlBeforeLogString;
				crlf;
				<< aLine;
				crlf;
				<< self mrlAfterLogString ]
]

{ #category : #accessing }
MRLInvocationArgument >> receiver [
	^ receiver
]

{ #category : #accessing }
MRLInvocationArgument >> receiver: anObject [
	receiver := anObject
]

{ #category : #api }
MRLInvocationArgument >> replacementMap [
	^ {('/' -> '_dividedBy_').
	('<>' -> '_isDifferentFrom_').
	($" -> '').
	($' -> '').
	(' ' -> '').
	('""' -> 'empty_string')} asOrderedDictionary
]

{ #category : #api }
MRLInvocationArgument >> saveMrlLogStrings [
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
	senderText := self insertMrlLogStringsIn: senderText.
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

{ #category : #accessing }
MRLInvocationArgument >> sender [
	^ sender
]

{ #category : #accessing }
MRLInvocationArgument >> sender: anObject [
	sender := anObject
]

{ #category : #accessing }
MRLInvocationArgument >> startPosition [
	^ startPosition
]

{ #category : #accessing }
MRLInvocationArgument >> startPosition: anObject [
	startPosition := anObject
]

{ #category : #accessing }
MRLInvocationArgument >> stopPosition [
	^ stopPosition
]

{ #category : #accessing }
MRLInvocationArgument >> stopPosition: anObject [
	stopPosition := anObject
]
