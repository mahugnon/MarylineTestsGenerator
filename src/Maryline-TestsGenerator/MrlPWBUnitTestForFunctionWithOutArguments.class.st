Class {
	#name : #MrlPWBUnitTestForFunctionWithOutArguments,
	#superclass : #MrlPWBUnitTestForFunction,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithOutArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isEmpty
]
