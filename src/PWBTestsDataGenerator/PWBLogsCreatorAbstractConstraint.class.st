"
I am a constraint  to apply for Loggers
"
Class {
	#name : #PWBLogsCreatorAbstractConstraint,
	#superclass : #Object,
	#instVars : [
		'constraint',
		'logsCreator',
		'pwbObjectName'
	],
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #api }
PWBLogsCreatorAbstractConstraint >> apply [
self subclassResponsibility 
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
PWBLogsCreatorAbstractConstraint >> pwbObjectName [
	^ pwbObjectName
]

{ #category : #accessing }
PWBLogsCreatorAbstractConstraint >> pwbObjectName: aString [
	pwbObjectName := aString
]
