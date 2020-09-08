Class {
	#name : #BooleanValueResolver,
	#superclass : #BasicTypeValueResolver,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #'as yet unclassified' }
BooleanValueResolver class >> accept: aTypeName [
	^ aTypeName asLowercase = 'boolean'
]

{ #category : #resolving }
BooleanValueResolver >> resolve: aString [
	^ aString
]
