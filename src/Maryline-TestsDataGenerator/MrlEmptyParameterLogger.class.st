Class {
	#name : #MrlEmptyParameterLogger,
	#superclass : #MrlAbstractLogger,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlEmptyParameterLogger class >> canlog: anObject withTag: aTag [
	^ (anObject isKindOf: FamixPWBParameter)
		and: [ anObject isReadOnly and: [ aTag = 'after' ] ]
]

{ #category : #accessing }
MrlEmptyParameterLogger >> belongsTo [
	^ focus behavioral
]

{ #category : #testing }
MrlEmptyParameterLogger >> isEmptyLogger [
	^ true
]

{ #category : #'as yet unclassified' }
MrlEmptyParameterLogger >> logOn: stream [
	^ stream
]

{ #category : #'as yet unclassified' }
MrlEmptyParameterLogger >> sortingKey [
^50
]
