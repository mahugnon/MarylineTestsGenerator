Class {
	#name : #RandomReturnValueGenerator,
	#superclass : #Object,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
RandomReturnValueGenerator class >> accept: aString [
	^ self subclassResponsibility
]

{ #category : #executing }
RandomReturnValueGenerator class >> valueFor: aString [
	^ (self subclasses detect: [ :sub | sub accept: aString ]) new value
]

{ #category : #evaluating }
RandomReturnValueGenerator >> value [
	^ self subclassResponsibility
]
