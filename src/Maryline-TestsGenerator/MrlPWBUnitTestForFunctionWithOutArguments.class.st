Class {
	#name : #MrlPWBUnitTestForFunctionWithOutArguments,
	#superclass : #MrlPWBUnitTestForFunction,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithOutArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation arguments isEmpty
]

{ #category : #accessing }
MrlPWBUnitTestForFunctionWithOutArguments >> invocation: anObject [
	| function |
	invocation := anObject.
	function := invocation candidates anyOne.
	self
		addVariable: (MrlPWBUnitTestComplexType new name: function parentType name;
		beforeValue:function parentType name)
]
