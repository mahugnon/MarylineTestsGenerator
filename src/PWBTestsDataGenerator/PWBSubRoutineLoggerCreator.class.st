"
I'm a logger creator for a PowerBuilder SubRoutine
"
Class {
	#name : #PWBSubRoutineLoggerCreator,
	#superclass : #PWBBehaviorLoggerCreator,
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #visiting }
PWBSubRoutineLoggerCreator class >> accept: aFamixPWBBehavior [
	^ aFamixPWBBehavior class = FamixPWBSubRoutine
]
