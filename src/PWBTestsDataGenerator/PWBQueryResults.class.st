Class {
	#name : #PWBQueryResults,
	#superclass : #Collection,
	#instVars : [
		'storage'
	],
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'instance creation' }
PWBQueryResults class >> withAll: aCollection [
	"Create a new collection containing all the elements from aCollection."

	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #adding }
PWBQueryResults >> add: newObject [
	"Include newObject as one of the receiver's elements. Answer newObject. 
	ArrayedCollections cannot respond to this message."

	^ storage add: newObject
]

{ #category : #adding }
PWBQueryResults >> addAll: aCollection [
	storage := aCollection
]

{ #category : #enumerating }
PWBQueryResults >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	^ storage do: aBlock
]

{ #category : #api }
PWBQueryResults >> first [
	^ storage first
]

{ #category : #adding }
PWBQueryResults >> initialize [

	super initialize.
	self initialize: OrderedCollection new
]

{ #category : #adding }
PWBQueryResults >> initialize: aCollectionForStorage [
	storage := aCollectionForStorage
]

{ #category : #removing }
PWBQueryResults >> remove: oldObject ifAbsent: anExceptionBlock [
	"Remove oldObject from the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	^ storage remove: oldObject ifAbsent: anExceptionBlock
]
