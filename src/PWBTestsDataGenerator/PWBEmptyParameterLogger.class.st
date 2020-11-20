Class {
	#name : #PWBEmptyParameterLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
PWBEmptyParameterLogger class >> canlog: anObject withTag: aTag [
	^ (anObject isKindOf: FamixPWBParameter)
		and: [ anObject isReadOnly and: [ aTag = 'after' ] ]
]

{ #category : #accessing }
PWBEmptyParameterLogger >> belongsTo [
	^ focus behavioral
]

{ #category : #testing }
PWBEmptyParameterLogger >> isEmptyLogger [
	^ true
]

{ #category : #'as yet unclassified' }
PWBEmptyParameterLogger >> logOn: stream [
	^ stream
]

{ #category : #'as yet unclassified' }
PWBEmptyParameterLogger >> sortingKey [
^50
]
