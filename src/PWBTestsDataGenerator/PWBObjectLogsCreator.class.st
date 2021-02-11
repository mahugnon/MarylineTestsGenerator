"
I'm a logger creator for a   PowerBuilder object
"
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
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #'as yet unclassified' }
PWBObjectLogsCreator class >> loggerWithAccessFor: aFamixPWBmajorObject [
	^ self new
		focus: aFamixPWBmajorObject;
		createLoggers;
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

{ #category : #api }
PWBObjectLogsCreator >> createLoggers [
	loggers := focus getBusinessRuleFunctions
		flatCollect:
			[ :each | PWBBehaviorLoggerCreator loggersFor: each accessOption: logAccess ]
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

{ #category : #initialization }
PWBObjectLogsCreator >> logAccess: aBoolean [
	logAccess := aBoolean
]

{ #category : #'as yet unclassified' }
PWBObjectLogsCreator >> loggedBehaviors [
	^ self loggers collectAsSet: [ :each | each belongsTo ]
]

{ #category : #accessors }
PWBObjectLogsCreator >> loggers [
	^ loggers
]

{ #category : #accessing }
PWBObjectLogsCreator >> loggers: aCollection [ 
	loggers := aCollection
]

{ #category : #api }
PWBObjectLogsCreator >> loggersWithPosition: position [
	^ (loggers select: [ :logger | logger position = position ])
		sorted: [ :a :b | a sortingKey < b sortingKey ]
]

{ #category : #accessing }
PWBObjectLogsCreator >> name [
	name ifNil: [ name := focus name ].
	^ name
]

{ #category : #api }
PWBObjectLogsCreator >> prepareLogs [
	| originalSource positions |
	positions := self loggers collectAsSet: #position.
	originalSource := focus sourceAnchor completeText.
	completeSourceWithLogs := String
		streamContents: [ :stream | 
			| start |
			start := 1.
			(positions sorted: [ :a :b | a < b ])
				do: [ :position | 
					stream
						<< (originalSource copyFrom: start to: position - 1);
						tab.
					(self loggersWithPosition: position)
						do: [ :value | value logOn: stream ].
					start := position ].
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
