Class {
	#name : #MrlInvocationLog,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'pwb_object',
		'pwb_behavior_calling',
		'pwb_behavior_called',
		'pwb_ligne_number',
		'timestamp',
		'return_Value'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlInvocationLog class >> session [
	| session login |
	login := self login.
	session := Maryline_invocation_logsDescriptorSystem
		sessionForLogin: login.
	session login.
	^ session
]
