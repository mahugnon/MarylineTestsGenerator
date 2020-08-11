Class {
	#name : #MrlPWBUnitTestForFunctionWithArguments,
	#superclass : #MrlPWBUnitTestForFunction,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isNotEmpty
]

{ #category : #accessing }
MrlPWBUnitTestForFunctionWithArguments >> invocation: aFamixPWBInvocation [
	super invocation: aFamixPWBInvocation.
	receiver := invocation candidates anyOne setParameters.
	receiver parameters do: [ :param | self addVariable: param ]
]
