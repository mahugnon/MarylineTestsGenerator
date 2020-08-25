Class {
	#name : #StringValueResolver,
	#superclass : #BasicTypeValueResolver,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #'as yet unclassified' }
StringValueResolver class >> accept: aTypeName [
	^ aTypeName asLowercase ='string'
]

{ #category : #resolving }
StringValueResolver >> resolve: aString [
	^ aString ifNil: [ '""' ] ifNotNil: [ '"' , aString , '"' ]
]
