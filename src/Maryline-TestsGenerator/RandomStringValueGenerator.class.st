Class {
	#name : #RandomStringValueGenerator,
	#superclass : #RandomReturnValueGenerator,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
RandomStringValueGenerator class >> accept: aString [
	^ aString asLowercase = 'string'
]

{ #category : #evaluating }
RandomStringValueGenerator >> value [
	^ {'random' . 'test' . 'balogoun' . 'agbanon'} anyOne
]
