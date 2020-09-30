Class {
	#name : #MrlTypeValueResolver,
	#superclass : #Object,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #'as yet unclassified' }
MrlTypeValueResolver class >> accept: aTypeName [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MrlTypeValueResolver class >> resolveValue: aString withType: aTypeName [
	^ (self subclasses detect: [ :sub | sub accept: aTypeName ]) new
		resolve: aString
]

{ #category : #resolving }
MrlTypeValueResolver >> resolve: aString [
	
]
