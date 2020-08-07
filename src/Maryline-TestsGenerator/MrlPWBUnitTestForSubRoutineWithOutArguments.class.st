Class {
	#name : #MrlPWBUnitTestForSubRoutineWithOutArguments,
	#superclass : #MrlPWBUnitTestForSubRoutine,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestForSubRoutineWithOutArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isEmpty
]
