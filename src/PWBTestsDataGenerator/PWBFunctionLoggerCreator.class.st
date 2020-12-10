Class {
	#name : #PWBFunctionLoggerCreator,
	#superclass : #PWBBehaviorLoggerCreator,
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #visiting }
PWBFunctionLoggerCreator class >> accept: aFamixPWBBehavior [
	^ aFamixPWBBehavior class = FamixPWBFunction
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
