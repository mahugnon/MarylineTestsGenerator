Class {
	#name : #MRLInvocationArgument,
	#superclass : #Object,
	#instVars : [
		'sender',
		'receiver',
		'startPosition',
		'stopPosition',
		'lineNumberInSender',
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
MRLInvocationArgument >> lineNumberInSender [
	^ lineNumberInSender
]

{ #category : #accessing }
MRLInvocationArgument >> lineNumberInSender: anObject [
	lineNumberInSender := anObject
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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

{ #category : #accessing }
MRLInvocationArgument >> receiver [
	^ receiver
]

{ #category : #accessing }
MRLInvocationArgument >> receiver: anObject [
	receiver := anObject
]

{ #category : #'as yet unclassified' }
MRLInvocationArgument >> saveMrlLogStrings [
	
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
