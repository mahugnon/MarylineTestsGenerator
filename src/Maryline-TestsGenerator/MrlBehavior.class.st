Class {
	#name : #MrlBehavior,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'behavior_name',
		'pwb_object',
		'sender',
		'behavior_id',
		'mrlParameters',
		'mrlReturnValues'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #accessing }
MrlBehavior class >> loadAllWithMrlParameterAndMrlReturnValues [
	^ self loadAll
		do: [ :behavior | 
			behavior
				loadMrlParameters;
				loadMrlReturnValues ]
]

{ #category : #'as yet unclassified' }
MrlBehavior class >> session [
	| session login |
	login := self login.
	session := MrlBehaviorDescriptorSystem sessionForLogin: login.
	session login.
	^ session
]

{ #category : #adding }
MrlBehavior >> addAllMrlParameters: aCollection [
	mrlParameters addAll: aCollection
]

{ #category : #adding }
MrlBehavior >> addAllMrlReturnValues: aCollection [
	mrlReturnValues addAll: aCollection
]

{ #category : #adding }
MrlBehavior >> addMrlParameter: aMrlParameter [
	mrlParameters add: aMrlParameter
]

{ #category : #adding }
MrlBehavior >> addMrlReturnValue: aMrlReturnValue [
	mrlReturnValues add: aMrlReturnValue
]

{ #category : #accessing }
MrlBehavior >> behavior_id [
	^ behavior_id
]

{ #category : #accessing }
MrlBehavior >> behavior_id: anObject [
	behavior_id := anObject
]

{ #category : #accessing }
MrlBehavior >> behavior_name [
	^ behavior_name
]

{ #category : #accessing }
MrlBehavior >> behavior_name: anObject [
	behavior_name := anObject
]

{ #category : #initialization }
MrlBehavior >> initialize [
	super initialize.
	mrlParameters := OrderedCollection new.
	mrlReturnValues := OrderedCollection new
]

{ #category : #'as yet unclassified' }
MrlBehavior >> loadMrlParameters [
	self
		addAllMrlParameters:
			(MrlParameter
				loadWhere: [ :mrlParameter | mrlParameter behavior_id = self behavior_id ])
]

{ #category : #'as yet unclassified' }
MrlBehavior >> loadMrlReturnValues [
	self
		addAllMrlReturnValues:
			(MrlReturnValue
				loadWhere: [ :mrlReturnValue | mrlReturnValue behavior_id = self behavior_id ])
]

{ #category : #accessing }
MrlBehavior >> mrlParameters [
	^ mrlParameters
]

{ #category : #accessing }
MrlBehavior >> mrlReturnValues [
	^ mrlReturnValues
]

{ #category : #accessing }
MrlBehavior >> pwb_object [
	^ pwb_object
]

{ #category : #accessing }
MrlBehavior >> pwb_object: anObject [
	pwb_object := anObject
]

{ #category : #accessing }
MrlBehavior >> sender [
	^ sender
]

{ #category : #accessing }
MrlBehavior >> sender: anObject [
	sender := anObject
]
