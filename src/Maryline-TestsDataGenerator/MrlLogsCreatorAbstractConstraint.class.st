Class {
	#name : #MrlLogsCreatorAbstractConstraint,
	#superclass : #Object,
	#instVars : [
		'constraint',
		'logsCreator'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
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
