Class {
	#name : #MRLTestMockInvocation,
	#superclass : #FamixPWBInvocation,
	#instVars : [
		'sourceText'
	],
	#category : #'Maryline-Models'
}

{ #category : #accessing }
MRLTestMockInvocation >> sourceText [
	^ sourceText
]

{ #category : #accessing }
MRLTestMockInvocation >> sourceText: aString [
	sourceText := aString
]
