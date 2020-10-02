Class {
	#name : #MRLInvocationArgumentTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #tests }
MRLInvocationArgumentTests >> testArgmentInvocationLineNumber [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation1) first
				invocationLineNumber
		equals: 3
]
