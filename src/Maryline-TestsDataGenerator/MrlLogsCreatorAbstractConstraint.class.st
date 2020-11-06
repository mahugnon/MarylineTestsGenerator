Class {
	#name : #MrlLogsCreatorAbstractConstraint,
	#superclass : #Object,
	#instVars : [
		'constraint',
		'logsCreator',
		'name'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #api }
MrlLogsCreatorAbstractConstraint >> apply [
self subclassResponsibility 
]

{ #category : #accessing }
MrlLogsCreatorAbstractConstraint >> constraint [
	^ constraint
]

{ #category : #accessing }
MrlLogsCreatorAbstractConstraint >> constraint: aConstraint [
constraint := aConstraint 
]

{ #category : #accessing }
MrlLogsCreatorAbstractConstraint >> logsCreator: aMrlObjectLogsCreator [ 
	logsCreator := aMrlObjectLogsCreator.
	self apply 
]

{ #category : #accessing }
MrlLogsCreatorAbstractConstraint >> name [
	^ name
]

{ #category : #accessing }
MrlLogsCreatorAbstractConstraint >> name: aString [
	name := aString
]
