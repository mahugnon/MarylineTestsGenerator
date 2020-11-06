Class {
	#name : #MrlObjectsLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'name',
		'constraints'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createwithAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerWithAccessFor: objects
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithoutAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createWithoutAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithoutAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerWithoutAccessFor: objects
]

{ #category : #adding }
MrlObjectsLogsCreator >> addConstraint: aConstraint [
	loggers
		detect: [ :logger | logger name = aConstraint name ]
		ifFound: [ :founded | founded addConstraint: aConstraint ]
]

{ #category : #api }
MrlObjectsLogsCreator >> createWithoutAccessLoggers [
	loggers := focus
		collect: [ :each | MrlObjectLogsCreator loggerWithoutAccessFor: each ]
]

{ #category : #api }
MrlObjectsLogsCreator >> createwithAccessLoggers [
	loggers := focus
		collect: [ :each | MrlObjectLogsCreator loggerWithAccessFor: each ]
]

{ #category : #accessing }
MrlObjectsLogsCreator >> focus: aCollection [ 
	focus := aCollection
]

{ #category : #accessing }
MrlObjectsLogsCreator >> loggers [
	^ loggers
]

{ #category : #printing }
MrlObjectsLogsCreator >> printOn: aStrem [
	^ aStrem
		<< 'Group';
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #actions }
MrlObjectsLogsCreator >> save [
	loggers do: #save
]
