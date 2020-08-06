Class {
	#name : #MrlPWBUnitTestvariable,
	#superclass : #Object,
	#instVars : [
		'scope',
		'name',
		'type',
		'value',
		'visibility'
	],
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestvariable class >> accept: aString [
	^ self subclassResponsibility
]

{ #category : #visiting }
MrlPWBUnitTestvariable class >> create: aTypeString [
^ self subclasses detect: [ :sub| sub accept: aTypeString  ] ifFound: [ :found| found new type: aTypeString   ] ifNone: [ self error: 'Type not found. Update me please!!' ]
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> name [
	^ name
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> name: anObject [
	name := anObject
]

{ #category : #printing }
MrlPWBUnitTestvariable >> printPWBDeclarationScript [
	^ self subclassResponsibility
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> scope [
	^ scope
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> type [
	^ type
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> value: anObject [
	value := anObject
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> visibility [
	^ visibility
]
