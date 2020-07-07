Class {
	#name : #MRLInvocationArgument,
	#superclass : #Object,
	#instVars : [
		'sender',
		'receiver',
		'startPosition',
		'stopPosition',
		'invocationText',
		'argumentString',
		'sizeOfAddedCharacters'
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
MRLInvocationArgument >> insertMrlLogStrings: aString [
	| lines |
	lines := aString lines
		select:
			[ :aLine | aLine includesSubstring: self invocationText caseSensitive: false ].
	^ lines
		collect:
			[ :aLine | aString copyReplaceAll: aLine with: (self mrlLogStringsFor: aLine) ]
]

{ #category : #api }
MRLInvocationArgument >> invocationLines: sourceText [
	| lines |
	lines := sourceText lines
		select:
			[ :aLine | aLine includesSubstring: self invocationText caseSensitive: false ].
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
	^ String
		streamContents: [ :aStream | 
			aStream
				<< 'f_mrl_log().log(';
				<< argumentString;
				<< ',';
				<< '"';
				<< sender name;
				<< '"';
				<< ',';
				<< '"';
				<< argumentString;
				<< '-after-';
				<< sender name;
				<< '"';
				<< ')' ]
]

{ #category : #api }
MRLInvocationArgument >> mrlBeforeLogString [
	^ String
		streamContents: [ :aStream | 
			aStream
				<< 'f_mrl_log().log(';
				<< argumentString;
				<< ',';
				<< '"';
				<< sender name;
				<< '"';
				<< ',';
				<< '"';
				<< argumentString;
				<< '-before-';
				<< sender name;
				<< '"';
				<< ')' ]
]

{ #category : #api }
MRLInvocationArgument >> mrlLogStringsFor: aLine [
	^ String
		streamContents: [ :aStream | 
			aStream
				<< self mrlBeforeLogString;
				cr;
				<< aLine;
				cr;
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
MRLInvocationArgument >> saveMrlLogStrings [
	| lines sourceText file beforeSender afterSender senderText |
	sizeOfAddedCharacters := 0.
	file := sender sourceAnchor rootFolder asFileReference
		resolve: sender sourceAnchor fileName.
	sourceText := file contents.
	beforeSender := sourceText
		copyFrom: 1
		to: sender sourceAnchor startPos - 1.
	afterSender := sourceText
		copyFrom: sender sourceAnchor endPos + 1
		to: sourceText size.
	senderText := sourceText
		copyFrom: sender sourceAnchor startPos
		to: sender sourceAnchor endPos.
	lines := self invocationLines: senderText.
	lines
		do: [ :aLine | 
			senderText := senderText
				copyReplaceAll: aLine
				with: (self mrlLogStringsFor: aLine) ].
	file
		writeStreamDo: [ :aStream | 
			aStream
				<< beforeSender;
				<< senderText;
				<< afterSender ].
	sender sourceAnchor
		endPos: sender sourceAnchor startPos + senderText size
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
