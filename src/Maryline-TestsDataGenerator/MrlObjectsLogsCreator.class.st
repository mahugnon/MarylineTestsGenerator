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

{ #category : #actions }
MrlObjectsLogsCreator >> save [
	loggers do: #save
]
