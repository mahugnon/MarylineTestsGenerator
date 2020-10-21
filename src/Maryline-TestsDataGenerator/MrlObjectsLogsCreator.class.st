Class {
	#name : #MrlObjectsLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerFor: aCollection [
	^ self new
		focus: aCollection;
		createLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerFor: objects
]

{ #category : #api }
MrlObjectsLogsCreator >> createLoggers [
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

{ #category : #actions }
MrlObjectsLogsCreator >> save [
	loggers do: #save
]
