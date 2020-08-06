Class {
	#name : #MrlPWBUnitTestvariable,
	#superclass : #Object,
	#instVars : [
		'scope',
		'name',
		'type',
		'beforeValue',
		'afterValue',
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
	^ self subclasses
		detect: [ :sub | sub accept: aTypeString ]
		ifFound: [ :found | 
			found new
				type: aTypeString;
				yourself ]
		ifNone: [ self error: 'Type not found. Update me please!!' ]
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> afterValue [
	^ afterValue
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> afterValue: anObject [
	afterValue := anObject
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> beforeValue [
	^ beforeValue
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> beforeValue: anObject [
	beforeValue := anObject
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
MrlPWBUnitTestvariable >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> type [
	^ type
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> type: anObject [
	type := anObject
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> visibility [
	^ visibility
]

{ #category : #accessing }
MrlPWBUnitTestvariable >> visibility: anObject [
	visibility := anObject
]
