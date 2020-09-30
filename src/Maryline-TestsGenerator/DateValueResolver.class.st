Class {
	#name : #DateValueResolver,
	#superclass : #MrlTypeValueResolver,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #'as yet unclassified' }
DateValueResolver class >> accept: aTypeName [
	^ aTypeName asLowercase = 'date'
]

{ #category : #resolving }
DateValueResolver >> resolve: aString [
	^ 'date("' , aString , '")'
]
