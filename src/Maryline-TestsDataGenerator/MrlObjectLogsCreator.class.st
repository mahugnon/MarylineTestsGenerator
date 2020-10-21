Class {
	#name : #MrlObjectLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'completeSourceWithLogs'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlObjectLogsCreator class >> loggerFor: aFamixPWBmajorObject [
	^ self new
		focus: aFamixPWBmajorObject;
		createLoggers;
		prepareLogs;
		yourself
]

{ #category : #accessing }
MrlObjectLogsCreator >> completeSourceWithLogs [
	^ completeSourceWithLogs
]

{ #category : #api }
MrlObjectLogsCreator >> createLoggers [
	loggers := (focus getBusinessRuleFunctions
		flatCollect: [ :each | MrlFunctionLoggerCreator loggersFor: each ])
		groupedBy: #position
]

{ #category : #accessing }
MrlObjectLogsCreator >> focus: aFamixPWBmajorObject [
	focus := aFamixPWBmajorObject
]

{ #category : #accessors }
MrlObjectLogsCreator >> loggers [
	^ loggers
]

{ #category : #api }
MrlObjectLogsCreator >> prepareLogs [
	| originalSource |
	originalSource := focus sourceAnchor completeText.
	completeSourceWithLogs := String
		streamContents: [ :stream | 
			| start |
			start := 1.
			(loggers keys sort: [ :a :b | a < b ])
				do: [ :key | 
					stream
						<< (originalSource copyFrom: start to: key - 1);
						tab.
					(loggers at: key) do: [ :value | value logOn: stream ].
					start := key ].
			stream << (originalSource copyFrom: start to: originalSource size) ]
]

{ #category : #actions }
MrlObjectLogsCreator >> save [
	focus fileReference
		writeStreamDo: [ :stream | stream << completeSourceWithLogs ]
]
