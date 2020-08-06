Class {
	#name : #MrlPWBUnitTestPrimitiveType,
	#superclass : #MrlPWBUnitTestvariable,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestPrimitiveType class >> accept: aString [
	^ { 'string'. 'boolean'. 'double'.'int'. 'integer'.'date'.'long' }
]
