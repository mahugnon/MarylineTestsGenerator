"
I represent a no parameter. I'm used as a null object pattern
"
Class {
	#name : #PWBEmptyParameterLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Logger'
}

{ #category : #'as yet unclassified' }
PWBEmptyParameterLogger class >> canlog: anObject withTag: aTag [
	^ anObject isParameter
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

{ #category : #sorting }
PWBEmptyParameterLogger >> logOn: stream [
	^ stream
]

{ #category : #sorting }
PWBEmptyParameterLogger >> sortingKey [
^50
]
