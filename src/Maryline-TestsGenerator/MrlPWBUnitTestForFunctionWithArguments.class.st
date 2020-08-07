Class {
	#name : #MrlPWBUnitTestForFunctionWithArguments,
	#superclass : #MrlPWBUnitTestForFunction,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isNotEmpty
]

{ #category : #accessing }
MrlPWBUnitTestForFunctionWithArguments >> invocation: aFamixPWBInvocation [ 
	super invocation: aFamixPWBInvocation.
	
]
