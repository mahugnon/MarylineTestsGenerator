Class {
	#name : #PWBObjectLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'completeSourceWithLogs',
		'logAccess',
		'name',
		'constraints'
	],
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
PWBObjectLogsCreator class >> loggerWithAccessFor: aFamixPWBmajorObject [
	^ self new
		focus: aFamixPWBmajorObject;
		createLoggers;
		prepareLogs;
		yourself
]

{ #category : #'as yet unclassified' }
PWBObjectLogsCreator class >> loggerWithoutAccessFor: aFamixPWBmajorObject [
	^ self new
		focus: aFamixPWBmajorObject;
		logAccess: false;
		createLoggers;
		yourself
]

{ #category : #adding }
PWBObjectLogsCreator >> addConstraint: aConstraint [
	constraints add: aConstraint.
	aConstraint logsCreator: self
]

{ #category : #accessing }
PWBObjectLogsCreator >> completeSourceWithLogs [
	^ completeSourceWithLogs
]

{ #category : #accessing }
PWBObjectLogsCreator >> constraint [
	^ constraints
]

{ #category : #api }
PWBObjectLogsCreator >> createLoggers [
	loggers := (focus getBusinessRuleFunctions
		flatCollect:
			[ :each | PWBFunctionLoggerCreator loggersFor: each accessOption: logAccess ])
		groupedBy: #position
]

{ #category : #accessing }
PWBObjectLogsCreator >> focus [
	^ focus
]

{ #category : #accessing }
PWBObjectLogsCreator >> focus: aFamixPWBmajorObject [
	focus := aFamixPWBmajorObject
]

{ #category : #initialization }
PWBObjectLogsCreator >> initialize [
	super initialize.
	logAccess := true.
	constraints := OrderedCollection new
]

{ #category : #api }
PWBObjectLogsCreator >> logA: a lessThanLogB: b [ 
a position < b position 
ifTrue: [ ^true ].
a sortingKey < b sortingKey
ifTrue: [ ^true ].
^false
]

{ #category : #initialization }
PWBObjectLogsCreator >> logAccess: aBoolean [
	logAccess := aBoolean
]

{ #category : #accessors }
PWBObjectLogsCreator >> loggers [
	^ loggers
]

{ #category : #accessing }
PWBObjectLogsCreator >> loggers: aCollection [ 
	loggers := aCollection
]

{ #category : #accessing }
PWBObjectLogsCreator >> name [
	name ifNil: [ name := focus name ].
	^ name
]

{ #category : #api }
PWBObjectLogsCreator >> prepareLogs [
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

{ #category : #printing }
PWBObjectLogsCreator >> printOn: aStrem [
	^ aStrem
		<< self name;
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #actions }
PWBObjectLogsCreator >> save [
	| focusFile utf8bomHeader |
	self prepareLogs.
	utf8bomHeader := #[16rEF 16rBB 16rBF].
	focusFile := focus sourceAnchor fileReference.
	focusFile
		ensureDelete;
		binaryWriteStreamDo: [ :s | s nextPutAll: utf8bomHeader ].
	focusFile := focusFile
		writeStreamDo: [ :stream | 
			stream setToEnd.
			stream << completeSourceWithLogs ]
]
