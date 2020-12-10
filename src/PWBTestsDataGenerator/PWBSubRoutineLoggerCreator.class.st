Class {
	#name : #PWBSubRoutineLoggerCreator,
	#superclass : #PWBBehaviorLoggerCreator,
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #visiting }
PWBSubRoutineLoggerCreator class >> accept: aFamixPWBBehavior [
	^ aFamixPWBBehavior class = FamixPWBSubRoutine
]

{ #category : #api }
PWBSubRoutineLoggerCreator >> createLoggers [
	self createTimestampLogger.
	self createVariableLoggers: 'before'.
	self createVariableLoggers: 'after'
]
