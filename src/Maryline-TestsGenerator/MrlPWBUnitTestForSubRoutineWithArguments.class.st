Class {
	#name : #MrlPWBUnitTestForSubRoutineWithArguments,
	#superclass : #MrlPWBUnitTestForSubRoutine,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestForSubRoutineWithArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isNotEmpty
]
