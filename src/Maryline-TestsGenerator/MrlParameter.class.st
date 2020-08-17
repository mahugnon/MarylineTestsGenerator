Class {
	#name : #MrlParameter,
	#superclass : #Object,
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
MrlParameter >> pwb_ligne_number [
	^ pwb_ligne_number
]

{ #category : #accessing }
MrlParameter >> pwb_ligne_number: anObject [
	pwb_ligne_number := anObject
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_name [
	^ pwb_parameter_name
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_name: anObject [
	pwb_parameter_name := anObject
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_syntax [
	^ pwb_parameter_syntax
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_syntax: anObject [
	pwb_parameter_syntax := anObject
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_value [
	^ pwb_parameter_value
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_value: anObject [
	pwb_parameter_value := anObject
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_value_context [
	^ pwb_parameter_value_context
]

{ #category : #accessing }
MrlParameter >> pwb_parameter_value_context: anObject [
	pwb_parameter_value_context := anObject
]

{ #category : #accessing }
MrlParameter >> timestamp [
	^ timestamp
]

{ #category : #accessing }
MrlParameter >> timestamp: anObject [
	timestamp := anObject
]
