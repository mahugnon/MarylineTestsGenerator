Class {
	#name : #RandomIntegerValueGenerator,
	#superclass : #RandomReturnValueGenerator,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
RandomIntegerValueGenerator class >> accept: aString [
	^ {'int' . 'integer'}
		anySatisfy: [ :each | each = aString asLowercase ]
]

{ #category : #evaluating }
RandomIntegerValueGenerator >> value [
	^ 919 asString	"(1 to: 1000) atRandom "
]
