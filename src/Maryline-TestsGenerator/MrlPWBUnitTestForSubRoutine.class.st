Class {
	#name : #MrlPWBUnitTestForSubRoutine,
	#superclass : #MrlPWBUnitTest,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForSubRoutine class >> accept: aFamixPWBInvocation [
	^ false
]

{ #category : #visiting }
MrlPWBUnitTestForSubRoutine class >> acceptFunction: aFamixPWBFunction [
	^ false
]
