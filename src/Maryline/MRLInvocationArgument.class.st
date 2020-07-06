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

{ #category : #accessing }
MRLInvocationArgument >> receiver [
	^ receiver
]

{ #category : #accessing }
MRLInvocationArgument >> receiver: anObject [
	receiver := anObject
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
