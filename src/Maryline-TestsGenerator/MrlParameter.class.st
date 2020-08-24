Class {
	#name : #MrlParameter,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'parameter_id',
		'parameter_name',
		'parameter_before_value',
		'parameter_after_value',
		'parameter_syntax',
		'line_number',
		'timestamp',
		'behavior_id',
		'parameter_selectSql'
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
MrlParameter >> parameter_name [
	^ parameter_name
]
