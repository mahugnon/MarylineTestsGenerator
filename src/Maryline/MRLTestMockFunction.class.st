Class {
	#name : #MRLTestMockFunction,
	#superclass : #FamixPWBFunction,
	#instVars : [
		'sourceText'
	],
	#category : #'Maryline-Models'
}

{ #category : #accessing }
MRLTestMockFunction >> sourceText [
	^ sourceText
]

{ #category : #accessing }
MRLTestMockFunction >> sourceText: aString [
	sourceText := aString
]
