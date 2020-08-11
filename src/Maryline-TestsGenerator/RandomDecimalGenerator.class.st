Class {
	#name : #RandomDecimalGenerator,
	#superclass : #RandomReturnValueGenerator,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
RandomDecimalGenerator class >> accept: aString [
	^ aString asLowercase = 'decimal'
]

{ #category : #evaluating }
RandomDecimalGenerator >> value [
	^ 10 * Random new next asString
]
