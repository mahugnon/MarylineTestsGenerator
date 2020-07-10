Class {
	#name : #MRLInvocationArgument,
	#superclass : #Object,
	#instVars : [
		'sender',
		'receiver',
		'startPosition',
		'stopPosition',
		'invocationText',
		'argumentString'
	],
	#category : #'Maryline-Models'
}

{ #category : #accessing }
MRLInvocationArgument >> argumentString [
	^ argumentString
]

{ #category : #accessing }
MRLInvocationArgument >> argumentString: anObject [
	argumentString := anObject
]

{ #category : #api }
MRLInvocationArgument >> generateInSourceTextMrlLogStrings [
	| file beforeSenderText afterSenderText senderText |
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
	| beforeSenderText afterSenderText oldSenderText newSenderText file newStartPos newEndPos sizeDiff |
	file := sender sourceAnchor rootFolder asFileReference
		resolve: sender sourceAnchor fileName.
	sizeDiff := aString size - file contents size.
	newStartPos := sender sourceAnchor startPos.
	newEndPos := sender sourceAnchor endPos + sizeDiff.
	beforeSenderText := aString copyFrom: 1 to: newStartPos - 1.
	afterSenderText := newEndPos >= aString size
		ifTrue: [ '' ]
		ifFalse: [ aString copyFrom: newEndPos + 1 to: aString size ].
	oldSenderText := file contents
		copyFrom: sender sourceAnchor startPos
		to: sender sourceAnchor endPos.
	newSenderText := aString
		copyFrom: sender sourceAnchor startPos
		to: newEndPos.
	(self invocationLines: oldSenderText)
		do: [ :aLine | 
			| mrlString |
			mrlString := self mrlLogStringsFor: aLine.
			newSenderText := (newSenderText includesSubstring: mrlString)
				ifTrue: [ newSenderText copyReplaceAll: mrlString with: mrlString ]
				ifFalse: [ newSenderText copyReplaceAll: aLine with: mrlString ] ].
	^ String
		streamContents: [ :aStream | 
			aStream
				<< beforeSenderText;
				<< newSenderText;
				<< afterSenderText ]
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

{ #category : #api }
MRLInvocationArgument >> invocationLines: sourceText [
	| lines |
	lines := sourceText lines
		select: [ :aLine | 
			(aLine matchesRegex: '//.*') not
				and: [ aLine includesSubstring: self invocationText caseSensitive: false ] ].
	^ lines asSet
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
	printable := argumentString copy.
	self replacementMap keys
		select: [ :key | printable includesSubstring: key asString ]
		thenDo: [ :key | 
			printable := printable
				copyReplaceAll: key asString
				with: (self replacementMap at: key) ].
	^ String
		streamContents: [ :aStream | 
			aStream
				<< 'f_mrl_logger().log(';
				<< argumentString;
				<< ',';
				<< '"';
				<< sender name;
				<< '"';
				<< ',';
				<< '"';
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

{ #category : #'as yet unclassified' }
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
