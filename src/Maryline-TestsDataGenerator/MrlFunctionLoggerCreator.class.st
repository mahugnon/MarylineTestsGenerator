Class {
	#name : #MrlFunctionLoggerCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'logAccess'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator class >> loggersFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
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
	^ aTag = 'before'
		ifTrue: [ {((MrlAbstractLogger loggerFor: aVariable)
				position: focus signature sourceAnchor endPos + 1;
				focus: aVariable;
				tag: aTag)} ]
		ifFalse: [ focus returns
				collect: [ :return | 
					(MrlAbstractLogger loggerFor: aVariable withTag: aTag)
						position: return sourceAnchor startPos;
						focus: aVariable ] ]
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> focus: aFamixPWBBehavior [
	focus := aFamixPWBBehavior
]

{ #category : #initialization }
MrlFunctionLoggerCreator >> initialize [
	super initialize.
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
MrlFunctionLoggerCreator >> parameterLoggers [
	^ loggers select: #isParameterLogger
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
