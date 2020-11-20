Class {
	#name : #MrlFunctionLoggerCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'logAccess',
		'name'
	],
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator class >> loggersFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		createLoggers;
		loggers
]

{ #category : #api }
MrlFunctionLoggerCreator class >> loggersFor: aFamixPWBFunction accessOption: aBolean [
	^ aBolean
		ifTrue: [ self loggersWithAccessFor: aFamixPWBFunction ]
		ifFalse: [ self loggersWithoutAccessFor: aFamixPWBFunction ]
]

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator class >> loggersWithAccessFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		createLoggers;
		loggers
]

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator class >> loggersWithoutAccessFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		logAccess: false;
		createLoggers;
		loggers
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> accessLoggers [
	^ loggers select: #isAccessLogger
]

{ #category : #api }
MrlFunctionLoggerCreator >> createLoggers [
self createVariableLoggers:'before'.
self createVariableLoggers:'after'.
self createReturnLoggers
	
]

{ #category : #api }
MrlFunctionLoggerCreator >> createReturnLogger: return [
	^ MrlReturnLogger new
		focus: return;
		position: return sourceAnchor startPos;
		yourself
]

{ #category : #api }
MrlFunctionLoggerCreator >> createReturnLoggers [
	loggers
		addAll:
			(focus returns collect: [ :return | self createReturnLogger: return ])
]

{ #category : #api }
MrlFunctionLoggerCreator >> createVariableLoggers: aTag [
	loggers
		addAll:
			(self variables
				flatCollect: [ :var | self createVariableLoggers: var withTag: aTag ])
]

{ #category : #api }
MrlFunctionLoggerCreator >> createVariableLoggers: aVariable withTag: aTag [
	| logger |
	^ aTag = 'before'
		ifTrue: [ logger := (MrlAbstractLogger loggerFor: aVariable tag: aTag)
				position: focus signature sourceAnchor endPos + 1.
			{logger} ]
		ifFalse: [ focus returns
				collect: [ :return | 
					(MrlAbstractLogger loggerFor: aVariable tag: aTag)
						position: return sourceAnchor startPos ] ]
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> focus: aFamixPWBBehavior [
	focus := aFamixPWBBehavior
]

{ #category : #initialization }
MrlFunctionLoggerCreator >> initialize [
	super initialize.
	loggers := OrderedCollection new.
	logAccess := true
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> logAccess: anObject [
	logAccess := anObject
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> loggers [
	^ loggers
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> loggers: anObject [
	loggers := anObject
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> name [
	name ifNil: [ name := focus name ].
	^ name
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> parameterLoggers [
	^ loggers select: #isParameterLogger
]

{ #category : #printing }
MrlFunctionLoggerCreator >> printOn: aStrem [
	^ aStrem
		<< self name;
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> returnLoggers [
	^ loggers select: #isReturnLogger
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> variables [
	^ logAccess
		ifTrue: [ focus parameters , focus instanceVariableAccesses ]
		ifFalse: [ focus parameters ]
]
