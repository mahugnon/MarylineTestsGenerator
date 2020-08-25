Class {
	#name : #BasicTypeValueResolver,
	#superclass : #Object,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #'as yet unclassified' }
BasicTypeValueResolver class >> accept: aTypeName [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BasicTypeValueResolver class >> resolveValue: aString withType: aTypeName [
	^ (self subclasses detect: [ :sub | sub accept: aTypeName ]) new
		resolve: aString
]

{ #category : #resolving }
BasicTypeValueResolver >> resolve: aString [
	^ self subclassResponsibility
]
