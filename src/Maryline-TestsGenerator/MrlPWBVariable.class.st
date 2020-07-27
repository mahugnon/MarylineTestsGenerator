Class {
	#name : #MrlPWBVariable,
	#superclass : #Object,
	#instVars : [
		'typeName',
		'name',
		'visibility',
		'preContextValue',
		'postContextValue',
		'context'
	],
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #accessing }
MrlPWBVariable >> name [
	^ name
]

{ #category : #accessing }
MrlPWBVariable >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MrlPWBVariable >> typeName [
	^ typeName
]

{ #category : #accessing }
MrlPWBVariable >> typeName: anObject [
	typeName := anObject
]

{ #category : #accessing }
MrlPWBVariable >> visibility [
	^ visibility
]

{ #category : #accessing }
MrlPWBVariable >> visibility: aString [ 
	visibility := aString
]
