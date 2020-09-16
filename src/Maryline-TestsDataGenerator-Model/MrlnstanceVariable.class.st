Class {
	#name : #MrlnstanceVariable,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'instance_variable_dataobject',
		'instance_variable_id',
		'instance_variable_name',
		'instance_variable_pwb_object'
	],
	#category : #'Maryline-TestsDataGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlnstanceVariable class >> session [
	| session login |
	login := self login.
	session := MrlnstanceVariableDescriptorSystem
		sessionForLogin: login.
	session login.
	^ session
]
