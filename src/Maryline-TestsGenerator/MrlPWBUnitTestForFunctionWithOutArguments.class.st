Class {
	#name : #MrlPWBUnitTestForFunctionWithOutArguments,
	#superclass : #MrlPWBUnitTest,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithOutArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isEmpty
]

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithOutArguments class >> acceptFunction: aFamixPWBFunction [
	^ aFamixPWBFunction parameters isEmpty
]
