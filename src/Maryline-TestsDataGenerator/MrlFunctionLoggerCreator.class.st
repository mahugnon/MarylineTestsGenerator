Class {
	#name : #MrlFunctionLoggerCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator class >> loggersFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		createLoggers;
		loggers
]

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator >> accessLoggers [
	^ loggers select: #isAccessLogger
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator >> createVariableLoggers: aTag [
	loggers
		addAll:
			(focus parameters , focus instanceVariableAccesses
				flatCollect: [ :var | self createVariableLoggers: var withTag: aTag ])
]

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator >> createVariableLoggers: aVariable withTag: aTag [
	^ aTag = 'before'
		ifTrue: [ {((MrlAbstractLogger loggerFor: aVariable)
				position: focus signature sourceAnchor endPos + 1;
				focus: aVariable;
				tag: aTag)} ]
		ifFalse: [ focus returns
				collect: [ :return | 
					(MrlAbstractLogger loggerFor: aVariable)
						position: return sourceAnchor startPos;
						focus: aVariable;
						tag: aTag ] ]
]

{ #category : #accessing }
MrlFunctionLoggerCreator >> focus: aFamixPWBBehavior [
	focus := aFamixPWBBehavior
]

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator >> initialize [
	super initialize.
	loggers := OrderedCollection new
]

{ #category : #accessors }
MrlFunctionLoggerCreator >> loggers [
	^ loggers
]

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator >> parameterLoggers [
	^ loggers select: #isParameterLogger
]

{ #category : #'as yet unclassified' }
MrlFunctionLoggerCreator >> returnLoggers [
	^ loggers select: #isReturnLogger
]
