Class {
	#name : #MrlAbstractLogger,
	#superclass : #Object,
	#instVars : [
		'position',
		'tag',
		'focus'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
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
MrlAbstractLogger class >> loggerFor: anObject [
	^ (self subclasses
		detect: [ :sub | sub canlog: anObject ]
		ifNone: [ self signal: 'Logger not found for: ' , anObject class name ])
		new
		focus: anObject;
		yourself
]

{ #category : #'as yet unclassified' }
MrlAbstractLogger class >> loggerFor: anObject withTag: aTag [
	^ (self subclasses
		detect: [ :sub | sub canlog: anObject withTag: aTag ]
		ifNone: [ self signal: 'Logger not found for: ' , anObject class name ])
		new
		focus: anObject;
		tag: aTag;
		yourself
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
	focus := aFamixPWBParameter
]

{ #category : #testing }
MrlAbstractLogger >> isAccessLogger [
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
