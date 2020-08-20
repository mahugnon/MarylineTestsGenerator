Class {
	#name : #MrlPossibleReturnValues,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'value',
		'function_name',
		'pwb_ligne_number',
		'timestamp'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlPossibleReturnValues class >> session [
	| session login |
	login := self login.
	session := Possible_return_valuesDescriptorSystem
		sessionForLogin: login.
	session login.
	^ session
]
