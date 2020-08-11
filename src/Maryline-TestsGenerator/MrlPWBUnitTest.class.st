Class {
	#name : #MrlPWBUnitTest,
	#superclass : #Object,
	#instVars : [
		'functionUnderTest',
		'name',
		'assertions',
		'variables',
		'owner',
		'invocation',
		'receiver'
	],
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTest class >> accept: aFamixPWBInvocation [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MrlPWBUnitTest class >> unitTestForInvocation: aFamixPWBInvocation [
	^ (self subclasses detect: [ :sub | sub accept: aFamixPWBInvocation ])
		new invocation: aFamixPWBInvocation
]

{ #category : #adding }
MrlPWBUnitTest >> addAssertion: aMrlPWBUnitTestAssertion [
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
MrlPWBUnitTest >> begin [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'event';
				space;
				<< self name;
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
MrlPWBUnitTest >> invocation [
	^ invocation
]

{ #category : #accessing }
MrlPWBUnitTest >> invocation: anObject [
	invocation := anObject.
	self setUp

]

{ #category : #accessing }
MrlPWBUnitTest >> name [
	name ifNil: [ name := 'test_' , functionUnderTest name ].
	^ name
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

{ #category : #initialization }
MrlPWBUnitTest >> setUp [
	functionUnderTest := invocation candidates anyOne.
	self
		addVariable:
			(MrlPWBUnitTestComplexType new
				name: functionUnderTest parentType name;
				beforeValue: functionUnderTest parentType name).
	self
		addAssertion:
			(MrlPWBAssertion new
				actual:
					'l_' , functionUnderTest parentType name , '.'
						, functionUnderTest name , '()';
				expected: functionUnderTest returnType generateRandomValue)
]

{ #category : #accessing }
MrlPWBUnitTest >> variables [
	^ variables
]
