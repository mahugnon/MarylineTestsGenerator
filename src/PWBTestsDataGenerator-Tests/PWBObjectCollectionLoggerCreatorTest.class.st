Class {
	#name : #PWBObjectCollectionLoggerCreatorTest,
	#superclass : #PWBAbstractObjectLoggerCreatorTest,
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBObjectCollectionLoggerCreatorTest >> createLogger [
	logger := PWBObjectGroupLogsCreator new focus: {testObject}
]

{ #category : #tests }
PWBObjectCollectionLoggerCreatorTest >> testCreateObjectsLogger [
	logger createwithAccessLoggers.
	self assert: logger loggers size equals: 1
]

{ #category : #tests }
PWBObjectCollectionLoggerCreatorTest >> testLoggedBehaviors [
	logger createwithAccessLoggers.
	self
		assertCollection: logger loggedBehaviors
		hasSameElements:
			{testFunction1.
			testFunction2}
]

{ #category : #tests }
PWBObjectCollectionLoggerCreatorTest >> testPWBObjectCollectionLogCreatorPrintOn [
	| name |
	logger createWithoutAccessLoggers.
	name := String streamContents: [ :stream | logger printOn: stream ].
	self assert: name equals: 'Group (1)'
]
