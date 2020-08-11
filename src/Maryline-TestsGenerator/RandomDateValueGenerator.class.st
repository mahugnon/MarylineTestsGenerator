Class {
	#name : #RandomDateValueGenerator,
	#superclass : #RandomReturnValueGenerator,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
RandomDateValueGenerator class >> accept: aString [
	^ aString asLowercase = 'date'
]

{ #category : #evaluating }
RandomDateValueGenerator >> value [
	^ 'Date(' , Date today mmddyyyy , ')'
]
