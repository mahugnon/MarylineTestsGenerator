Class {
	#name : #MrlBehavior,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'behavior_name',
		'pwb_object',
		'sender',
		'behavior_id'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlBehavior class >> session [
	| session login |
	login := self login.
	session := MrlBehaviorDescriptorSystem sessionForLogin: login.
	session login.
	^ session
]
