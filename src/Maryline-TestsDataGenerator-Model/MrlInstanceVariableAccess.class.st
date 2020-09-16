Class {
	#name : #MrlInstanceVariableAccess,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'instance_variable_access_accessed',
		'instance_variable_access_accessor',
		'instance_variable_access_id',
		'instance_variable_access_timestamp'
	],
	#category : #'Maryline-TestsDataGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlInstanceVariableAccess class >> session [
	| session login |
	login := self login.
	session := MrlInstanceVariableAccessDescriptorSystem
		sessionForLogin: login.
	session login.
	^ session
]
