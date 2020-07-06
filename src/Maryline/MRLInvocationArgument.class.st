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
	| lines senderText |
	senderText := sender sourceText.
	lines := senderText lines
		select:
			[ :aLine | aLine includesSubstring: self invocationText caseSensitive: false ].
	lines
		do: [ :aLine | 
			sender
				sourceText:
					(senderText copyReplaceAll: aLine with: (self mrlLogStringsFor: aLine)) ]
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
