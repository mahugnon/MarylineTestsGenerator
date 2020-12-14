Class {
	#name : #PWBLogsCreatorAbstractConstraint,
	#superclass : #Object,
	#instVars : [
		'constraint',
		'logsCreator',
		'name'
	],
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #api }
PWBLogsCreatorAbstractConstraint >> apply [
self subclassResponsibility 
]

{ #category : #accessing }
PWBLogsCreatorAbstractConstraint >> constraint [
	^ constraint
]

{ #category : #accessing }
PWBLogsCreatorAbstractConstraint >> constraint: aConstraint [
constraint := aConstraint 
]

{ #category : #accessing }
PWBLogsCreatorAbstractConstraint >> logsCreator: aMrlObjectLogsCreator [ 
	logsCreator := aMrlObjectLogsCreator.
	self apply 
]

{ #category : #accessing }
PWBLogsCreatorAbstractConstraint >> name [
	^ name
]

{ #category : #accessing }
PWBLogsCreatorAbstractConstraint >> name: aString [
	name := aString
]
