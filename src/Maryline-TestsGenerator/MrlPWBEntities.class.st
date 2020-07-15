Class {
	#name : #MrlPWBEntities,
	#superclass : #Object,
	#instVars : [
		'header',
		'footer'
	],
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #'as yet unclassified' }
MrlPWBEntities class >> getType: aString [
	^ (self subclasses detect: [ :sub | sub typeName = aString ]) new
]

{ #category : #'as yet unclassified' }
MrlPWBEntities class >> typeName [
	^ self subclassResponsibility
]

{ #category : #accessing }
MrlPWBEntities >> footer [
	^ footer
]

{ #category : #accessing }
MrlPWBEntities >> footer: anObject [
	footer := anObject
]

{ #category : #accessing }
MrlPWBEntities >> header [
	^ header
]

{ #category : #accessing }
MrlPWBEntities >> header: anObject [
	header := anObject
]
