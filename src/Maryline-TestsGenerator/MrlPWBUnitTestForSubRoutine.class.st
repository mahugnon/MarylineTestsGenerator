Class {
	#name : #MrlPWBUnitTestForSubRoutine,
	#superclass : #MrlPWBUnitTest,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForSubRoutine class >> accept: aFamixPWBInvocation [
	^ (aFamixPWBInvocation candidates
		allSatisfy: [ :each | each isKindOf: FamixPWBSubRoutine ])
		and: [ self subclasses
				anySatisfy: [ :sub | sub accept: aFamixPWBInvocation ] ]
]
