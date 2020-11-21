Class {
	#name : #PWBAbstractLogger,
	#superclass : #Object,
	#instVars : [
		'position',
		'tag',
		'focus'
	],
	#category : #'PWBTestsDataGenerator-Logger'
}

{ #category : #'as yet unclassified' }
PWBAbstractLogger class >> canlog: anObject [
	^ false
]

{ #category : #'as yet unclassified' }
PWBAbstractLogger class >> canlog: anObject withTag: aTag [
	^ false
]

{ #category : #'as yet unclassified' }
PWBAbstractLogger class >> loggerFor: anObject tag: aTag [
	^ (self subclasses
		detect: [ :sub | sub canlog: anObject withTag: aTag ]
		ifNone: [ NotFound signal: 'Logger not found ... ' ]) new
		focus: anObject;
		tag: aTag;
		yourself
]

{ #category : #accessing }
PWBAbstractLogger >> belongsTo [
self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
PWBAbstractLogger >> endOn: stream [
	stream
		<< '",ls_time);';
		tab
]

{ #category : #accessors }
PWBAbstractLogger >> focus [
	^ focus
]

{ #category : #accessing }
PWBAbstractLogger >> focus: aFamixPWBParameter [
	focus := aFamixPWBParameter.

]

{ #category : #testing }
PWBAbstractLogger >> isAccessLogger [
	^ false
]

{ #category : #testing }
PWBAbstractLogger >> isEmptyLogger [
	^ false
]

{ #category : #testing }
PWBAbstractLogger >> isParameterLogger [
	^ false
]

{ #category : #testing }
PWBAbstractLogger >> isReturnLogger [
	^ false
]

{ #category : #testing }
PWBAbstractLogger >> isTimestampLogger [
	^ false
]

{ #category : #'as yet unclassified' }
PWBAbstractLogger >> logOn: aStream [ 
self subclassResponsibility 
]

{ #category : #accessors }
PWBAbstractLogger >> position [
	^ position
]

{ #category : #accessor }
PWBAbstractLogger >> position: anInteger [ 
	position := anInteger
]

{ #category : #accessors }
PWBAbstractLogger >> tag [
	^ tag
]

{ #category : #accessing }
PWBAbstractLogger >> tag: aString [ 
	tag := aString
]
