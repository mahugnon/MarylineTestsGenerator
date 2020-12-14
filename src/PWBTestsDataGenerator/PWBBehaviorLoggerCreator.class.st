Class {
	#name : #PWBBehaviorLoggerCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'logAccess',
		'name'
	],
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #visiting }
PWBBehaviorLoggerCreator class >> accept: aFamixPWBBehavior [ 
self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
PWBBehaviorLoggerCreator class >> loggersFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		createLoggers;
		loggers
]

{ #category : #api }
PWBBehaviorLoggerCreator class >> loggersFor: aFamixPWBBehavior accessOption: aBolean [
	| logCreator |
	logCreator := self subclasses
		detect: [ :sub | sub accept: aFamixPWBBehavior ].
	^ aBolean
		ifTrue: [ logCreator loggersWithAccessFor: aFamixPWBBehavior ]
		ifFalse: [ logCreator loggersWithoutAccessFor: aFamixPWBBehavior ]
]

{ #category : #'as yet unclassified' }
PWBBehaviorLoggerCreator class >> loggersWithAccessFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		createLoggers;
		loggers
]

{ #category : #'as yet unclassified' }
PWBBehaviorLoggerCreator class >> loggersWithoutAccessFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		logAccess: false;
		createLoggers;
		loggers
]

{ #category : #accessing }
PWBBehaviorLoggerCreator >> accessLoggers [
	^ loggers select: #isAccessLogger
]

{ #category : #api }
PWBBehaviorLoggerCreator >> createLoggers [
self createTimestampLogger.
self createVariableLoggers:'before'.
self createVariableLoggers:'after'.
self createReturnLoggers
	
]

{ #category : #api }
PWBBehaviorLoggerCreator >> createTimestampLogger [
	loggers
		add:
			((PWBTimestampLogger loggerFor: focus)
				position: focus signature sourceAnchor endPos + 1)
]

{ #category : #api }
PWBBehaviorLoggerCreator >> createVariableLoggers: aTag [
	loggers
		addAll:
			(self variables
				flatCollect: [ :var | self createVariableLoggers: var withTag: aTag ])
]

{ #category : #api }
PWBBehaviorLoggerCreator >> createVariableLoggers: aVariable withTag: aTag [
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
PWBBehaviorLoggerCreator >> focus: aFamixPWBBehavior [
	focus := aFamixPWBBehavior
]

{ #category : #initialization }
PWBBehaviorLoggerCreator >> initialize [
	super initialize.
	loggers := OrderedCollection new.
	logAccess := true
]

{ #category : #accessing }
PWBBehaviorLoggerCreator >> logAccess: anObject [
	logAccess := anObject
]

{ #category : #accessing }
PWBBehaviorLoggerCreator >> loggers [
	^ loggers
]

{ #category : #accessing }
PWBBehaviorLoggerCreator >> loggers: anObject [
	loggers := anObject
]

{ #category : #accessing }
PWBBehaviorLoggerCreator >> name [
	name ifNil: [ name := focus name ].
	^ name
]

{ #category : #accessing }
PWBBehaviorLoggerCreator >> parameterLoggers [
	^ loggers select: #isParameterLogger
]

{ #category : #printing }
PWBBehaviorLoggerCreator >> printOn: aStrem [
	^ aStrem
		<< self name;
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #accessing }
PWBBehaviorLoggerCreator >> variables [
	^ logAccess
		ifTrue: [ focus parameters , focus getOneAccessPerInsVarAccessed ]
		ifFalse: [ focus parameters ]
]
