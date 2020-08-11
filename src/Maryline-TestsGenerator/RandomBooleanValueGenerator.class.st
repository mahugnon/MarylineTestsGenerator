Class {
	#name : #RandomBooleanValueGenerator,
	#superclass : #RandomReturnValueGenerator,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
RandomBooleanValueGenerator class >> accept: aString [
	^ aString asLowercase = 'boolean'
]

{ #category : #evaluating }
RandomBooleanValueGenerator >> value [
	^ (1 to: 9) atRandom odd asString
]
