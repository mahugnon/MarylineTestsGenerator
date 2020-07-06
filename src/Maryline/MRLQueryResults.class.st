Class {
	#name : #MRLQueryResults,
	#superclass : #Collection,
	#instVars : [
		'storage'
	],
	#category : #'Maryline-Models'
}

{ #category : #adding }
MRLQueryResults >> add: newObject [
	"Include newObject as one of the receiver's elements. Answer newObject. 
	ArrayedCollections cannot respond to this message."

	^ storage add: newObject
]

{ #category : #enumerating }
MRLQueryResults >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	^ storage do: aBlock
]

{ #category : #removing }
MRLQueryResults >> remove: oldObject ifAbsent: anExceptionBlock [
	"Remove oldObject from the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	^ storage remove: oldObject ifAbsent: anExceptionBlock
]
