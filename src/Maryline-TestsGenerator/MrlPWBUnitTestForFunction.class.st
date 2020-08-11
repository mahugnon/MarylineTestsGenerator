Class {
	#name : #MrlPWBUnitTestForFunction,
	#superclass : #MrlPWBUnitTest,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForFunction class >> accept: aFamixPWBInvocation [
	^ (aFamixPWBInvocation candidates
		anySatisfy: [ :each | each isKindOf: FamixPWBFunction ])
		and: [ self subclasses
				anySatisfy: [ :sub | sub accept: aFamixPWBInvocation ] ]
]
