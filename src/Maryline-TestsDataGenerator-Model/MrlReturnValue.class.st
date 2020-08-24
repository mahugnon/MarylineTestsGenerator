Class {
	#name : #MrlReturnValue,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'value',
		'behavior_id',
		'line_number',
		'timestamp'
	],
	#category : #'Maryline-TestsDataGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlReturnValue class >> session [
	| session login |
	login := self login.
	session := MrlReturnValueDescriptorSystem
		sessionForLogin: login.
	session login.
	^ session
]
