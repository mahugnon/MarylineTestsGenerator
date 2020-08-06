Class {
	#name : #MrlPWBUnitTest,
	#superclass : #Object,
	#instVars : [
		'name',
		'assertions',
		'variables',
		'owner'
	],
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #adding }
MrlPWBUnitTest >> addAssertions: aMrlPWBUnitTestAssertion [
	self assertions
		detect: [ :assertion | assertion = aMrlPWBUnitTestAssertion ]
		ifNone: [ assertions add: aMrlPWBUnitTestAssertion ]
]

{ #category : #adding }
MrlPWBUnitTest >> addVariable: aMrlPWBUnitTestVariable [
	self variables
		detect: [ :var | var = aMrlPWBUnitTestVariable ]
		ifNone: [ variables add: aMrlPWBUnitTestVariable ]
]

{ #category : #accessing }
MrlPWBUnitTest >> assertions [
	^ assertions
]

{ #category : #accessing }
MrlPWBUnitTest >> assertions: anObject [
	assertions := anObject
]

{ #category : #accessing }
MrlPWBUnitTest >> begin [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'event';
				space;
				<< name;
				<< '();';
				crlf ]
]

{ #category : #accessing }
MrlPWBUnitTest >> end [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'return;';
				crlf;
				<< 'end event' ]
]

{ #category : #initialization }
MrlPWBUnitTest >> initialize [
	variables := OrderedCollection new.
	assertions := OrderedCollection new
]

{ #category : #accessing }
MrlPWBUnitTest >> name [
	^ name
]

{ #category : #accessing }
MrlPWBUnitTest >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MrlPWBUnitTest >> owner [
	^ owner
]

{ #category : #accessing }
MrlPWBUnitTest >> owner: anObject [
	owner := anObject.
	owner addType: self
]

{ #category : #printing }
MrlPWBUnitTest >> printPWBDeclarationScript [
	^ String
		streamContents: [ :stream | 
			stream
				<< self begin;
				crlf.
			variables do: [ :var | stream << var printPWBDeclarationScript ].
			assertions
				do: [ :assert | stream << assert printPWBDeclarationScript ].
			stream
				<< self end;
				crlf ]
]

{ #category : #adding }
MrlPWBUnitTest >> removeVariable: aMrlPWBUnitTestVariable [
	self variables
		detect: [ :var | var = aMrlPWBUnitTestVariable ]
		ifFound: [ variables remove: aMrlPWBUnitTestVariable ]
		ifNone: [  ]
]

{ #category : #accessing }
MrlPWBUnitTest >> variables [
	^ variables
]
