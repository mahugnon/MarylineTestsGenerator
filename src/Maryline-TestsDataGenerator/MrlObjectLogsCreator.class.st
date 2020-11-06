Class {
	#name : #MrlObjectLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'completeSourceWithLogs',
		'logAccess',
		'name',
		'constraints'
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

{ #category : #adding }
MrlObjectLogsCreator >> addConstraint: aConstraint [
	constraints add: aConstraint.
	aConstraint logsCreator: self
]

{ #category : #accessing }
MrlObjectLogsCreator >> completeSourceWithLogs [
	^ completeSourceWithLogs
]

{ #category : #accessing }
MrlObjectLogsCreator >> constraint [
	^ constraints
]

{ #category : #api }
MrlObjectLogsCreator >> createLoggers [
	loggers := (focus getBusinessRuleFunctions
		flatCollect:
			[ :each | MrlFunctionLoggerCreator loggersFor: each accessOption: logAccess ])
		groupedBy: #position
]

{ #category : #accessing }
MrlObjectLogsCreator >> focus [
	^ focus
]

{ #category : #accessing }
MrlObjectLogsCreator >> focus: aFamixPWBmajorObject [
	focus := aFamixPWBmajorObject
]

{ #category : #initialization }
MrlObjectLogsCreator >> initialize [
	super initialize.
	logAccess := true.
	constraints := OrderedCollection new
]

{ #category : #api }
MrlObjectLogsCreator >> logA: a lessThanLogB: b [ 
a position < b position 
ifTrue: [ ^true ].
a sortingKey < b sortingKey
ifTrue: [ ^true ].
^false
]

{ #category : #initialization }
MrlObjectLogsCreator >> logAccess: aBoolean [
	logAccess := aBoolean
]

{ #category : #accessors }
MrlObjectLogsCreator >> loggers [
	^ loggers
]

{ #category : #accessing }
MrlObjectLogsCreator >> loggers: aCollection [ 
	loggers := aCollection
]

{ #category : #accessing }
MrlObjectLogsCreator >> name [
	name ifNil: [ name := focus name ].
	^ name
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

{ #category : #printing }
MrlObjectLogsCreator >> printOn: aStrem [
	^ aStrem
		<< self name;
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #actions }
MrlObjectLogsCreator >> save [
	| focusFile utf8bomHeader |
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
