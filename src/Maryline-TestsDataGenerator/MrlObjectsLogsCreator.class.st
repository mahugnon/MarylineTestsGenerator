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

{ #category : #api }
MrlObjectsLogsCreator >> createLoggers [
	loggers := focus
		collect: [ :each | MrlObjectLogsCreator loggerFor: each ]
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
