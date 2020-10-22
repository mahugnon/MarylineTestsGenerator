Class {
	#name : #MrlObjectLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'completeSourceWithLogs',
		'logAccess'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlObjectLogsCreator class >> loggerWithAccessFor: aFamixPWBmajorObject [
	^ self new
		focus: aFamixPWBmajorObject;
		createLoggers;
		prepareLogs;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectLogsCreator class >> loggerWithoutAccessFor: aFamixPWBmajorObject [
	^ self new
		focus: aFamixPWBmajorObject;
		logAccess: false;
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
		flatCollect:
			[ :each | MrlFunctionLoggerCreator loggersFor: each accessOption: logAccess ])
		groupedBy: #position
]

{ #category : #accessing }
MrlObjectLogsCreator >> focus: aFamixPWBmajorObject [
	focus := aFamixPWBmajorObject
]

{ #category : #initialization }
MrlObjectLogsCreator >> initialize [
super initialize .
logAccess :=true
]

{ #category : #initialization }
MrlObjectLogsCreator >> logAccess: aBoolean [
	logAccess := aBoolean
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
	focus sourceAnchor fileReference
		writeStreamDo: [ :stream | stream << completeSourceWithLogs ]
]
