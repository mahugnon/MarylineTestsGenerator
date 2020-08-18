Class {
	#name : #MrlParameter,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'pwb_parameter_name',
		'pwb_parameter_value',
		'pwb_parameter_syntax',
		'pwb_parameter_value_context',
		'pwb_ligne_number',
		'timestamp'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #accessing }
MrlParameter class >> session [
	| session login |
	login := self login.
	session := ParameterDescriptorSystem sessionForLogin: login.
	session login.
	^ session
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_name [
	^ pwb_parameter_name
]
