Class {
	#name : #MrlAbstractLogger,
	#superclass : #Object,
	#instVars : [
		'position',
		'tag',
		'focus'
	],
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlAbstractLogger class >> canlog: anObject [
	^ false
]

{ #category : #'as yet unclassified' }
MrlAbstractLogger class >> canlog: anObject withTag: aTag [
	^ false
]

{ #category : #'as yet unclassified' }
MrlAbstractLogger class >> loggerFor: anObject tag: aTag [
	^ (self subclasses
		detect: [ :sub | sub canlog: anObject withTag: aTag ]
		ifNone: [ NotFound signal: 'Logger not found ... ' ]) new
		focus: anObject;
		tag: aTag;
		yourself
]

{ #category : #accessing }
MrlAbstractLogger >> belongsTo [
self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MrlAbstractLogger >> endOn: stream [
	stream
		<< '");';
		tab
]

{ #category : #accessors }
MrlAbstractLogger >> focus [
	^ focus
]

{ #category : #accessing }
MrlAbstractLogger >> focus: aFamixPWBParameter [
	focus := aFamixPWBParameter.

]

{ #category : #testing }
MrlAbstractLogger >> isAccessLogger [
	^ false
]

{ #category : #testing }
MrlAbstractLogger >> isEmptyLogger [
	^ false
]

{ #category : #testing }
MrlAbstractLogger >> isParameterLogger [
	^ false
]

{ #category : #testing }
MrlAbstractLogger >> isReturnLogger [
	^ false
]

{ #category : #'as yet unclassified' }
MrlAbstractLogger >> logOn: aStream [ 
self subclassResponsibility 
]

{ #category : #accessors }
MrlAbstractLogger >> position [
	^ position
]

{ #category : #accessor }
MrlAbstractLogger >> position: anInteger [ 
	position := anInteger
]

{ #category : #accessors }
MrlAbstractLogger >> tag [
	^ tag
]

{ #category : #accessing }
MrlAbstractLogger >> tag: aString [ 
	tag := aString
]
