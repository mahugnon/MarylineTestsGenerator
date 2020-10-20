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
MrlAbstractLogger >> endOn: stream [
	stream
		<< '");';
		tab
]

{ #category : #accessing }
MrlAbstractLogger >> focus: aFamixPWBParameter [ 
	focus := aFamixPWBParameter
]

{ #category : #accessing }
MrlAbstractLogger >> tag: aString [ 
	tag := aString
]
