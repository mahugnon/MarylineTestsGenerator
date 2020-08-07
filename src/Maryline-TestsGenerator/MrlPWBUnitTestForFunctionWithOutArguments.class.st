Class {
	#name : #MrlPWBUnitTestForFunctionWithOutArguments,
	#superclass : #MrlPWBUnitTestForFunction,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithOutArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isEmpty
]
