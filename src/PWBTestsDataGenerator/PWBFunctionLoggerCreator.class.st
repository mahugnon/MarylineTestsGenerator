Class {
	#name : #PWBFunctionLoggerCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'logAccess',
		'name'
	],
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #'as yet unclassified' }
PWBFunctionLoggerCreator class >> loggersFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		createLoggers;
		loggers
]

{ #category : #api }
PWBFunctionLoggerCreator class >> loggersFor: aFamixPWBFunction accessOption: aBolean [
	^ aBolean
		ifTrue: [ self loggersWithAccessFor: aFamixPWBFunction ]
		ifFalse: [ self loggersWithoutAccessFor: aFamixPWBFunction ]
]

{ #category : #'as yet unclassified' }
PWBFunctionLoggerCreator class >> loggersWithAccessFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		createLoggers;
		loggers
]

{ #category : #'as yet unclassified' }
PWBFunctionLoggerCreator class >> loggersWithoutAccessFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		logAccess: false;
		createLoggers;
		loggers
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> accessLoggers [
	^ loggers select: #isAccessLogger
]

{ #category : #api }
PWBFunctionLoggerCreator >> createLoggers [
self createTimestampLogger.
self createVariableLoggers:'before'.
self createVariableLoggers:'after'.
self createReturnLoggers
	
]

{ #category : #api }
PWBFunctionLoggerCreator >> createReturnLogger: return [
	^ PWBReturnLogger new
		focus: return;
		position: return sourceAnchor startPos;
		yourself
]

{ #category : #api }
PWBFunctionLoggerCreator >> createReturnLoggers [
	loggers
		addAll:
			(focus returns collect: [ :return | self createReturnLogger: return ])
]

{ #category : #api }
PWBFunctionLoggerCreator >> createTimestampLogger [
	loggers
		add:
			((PWBTimestampLogger loggerFor: focus)
				position: focus signature sourceAnchor endPos + 1)
]

{ #category : #api }
PWBFunctionLoggerCreator >> createVariableLoggers: aTag [
	loggers
		addAll:
			(self variables
				flatCollect: [ :var | self createVariableLoggers: var withTag: aTag ])
]

{ #category : #api }
PWBFunctionLoggerCreator >> createVariableLoggers: aVariable withTag: aTag [
	| logger |
	^ aTag = 'before'
		ifTrue: [ logger := (PWBAbstractLogger loggerFor: aVariable tag: aTag)
				position: focus signature sourceAnchor endPos + 1.
			{logger} ]
		ifFalse: [ focus returns
				collect: [ :return | 
					(PWBAbstractLogger loggerFor: aVariable tag: aTag)
						position: return sourceAnchor startPos ] ]
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> focus: aFamixPWBBehavior [
	focus := aFamixPWBBehavior
]

{ #category : #initialization }
PWBFunctionLoggerCreator >> initialize [
	super initialize.
	loggers := OrderedCollection new.
	logAccess := true
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> logAccess: anObject [
	logAccess := anObject
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> loggers [
	^ loggers
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> loggers: anObject [
	loggers := anObject
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> name [
	name ifNil: [ name := focus name ].
	^ name
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> parameterLoggers [
	^ loggers select: #isParameterLogger
]

{ #category : #printing }
PWBFunctionLoggerCreator >> printOn: aStrem [
	^ aStrem
		<< self name;
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> returnLoggers [
	^ loggers select: #isReturnLogger
]

{ #category : #accessing }
PWBFunctionLoggerCreator >> variables [
	^ logAccess
		ifTrue: [ focus parameters , focus instanceVariableAccesses ]
		ifFalse: [ focus parameters ]
]
