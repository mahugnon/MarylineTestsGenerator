Class {
	#name : #MrlPWBUnitTest,
	#superclass : #Object,
	#instVars : [
		'functionUnderTest',
		'name',
		'assertions',
		'owner',
		'invocation',
		'receiver',
		'testsData'
	],
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTest class >> accept: aFamixPWBInvocation [
	^ self subclassResponsibility
]

{ #category : #visiting }
MrlPWBUnitTest class >> acceptFunction: aFamixPWBFunction [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MrlPWBUnitTest class >> unitTestForFunction: aFamixPWBFunction [
	aFamixPWBFunction setParameters.
	^ (self subclasses
		detect: [ :sub | sub acceptFunction: aFamixPWBFunction ]) new
		functionUnderTest: aFamixPWBFunction
]

{ #category : #'as yet unclassified' }
MrlPWBUnitTest class >> unitTestsForFunction: aFamixPWBFunction [
	aFamixPWBFunction setParameters.
	^ (self subclasses
		select: [ :sub | sub acceptFunction: aFamixPWBFunction ])
		do: [ :sub | sub new functionUnderTest: aFamixPWBFunction ]
]

{ #category : #adding }
MrlPWBUnitTest >> addAssertion: aMrlPWBUnitTestAssertion [
	self assertions
		detect: [ :assertion | assertion = aMrlPWBUnitTestAssertion ]
		ifNone: [ assertions add: aMrlPWBUnitTestAssertion ]
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
MrlPWBUnitTest >> beginOn: stream [
	^ stream
		<< 'event';
		space;
		<< self name;
		<< '();';
		crlf;
		crlf
]

{ #category : #'as yet unclassified' }
MrlPWBUnitTest >> createAssertionsFromData [
	assertions addAll: self testsData createAssertionsFromData
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

{ #category : #accessing }
MrlPWBUnitTest >> endOn: stream [
	^ stream
		<< 'return;';
		crlf;
		<< 'end event';
		crlf;
		crlf
]

{ #category : #accessing }
MrlPWBUnitTest >> functionUnderTest [
	^ functionUnderTest
]

{ #category : #accessing }
MrlPWBUnitTest >> functionUnderTest: anObject [
	functionUnderTest := anObject
]

{ #category : #initialization }
MrlPWBUnitTest >> initialize [
	assertions := Set new
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

{ #category : #'as yet unclassified' }
MrlPWBUnitTest >> loadTestData [
	testsData := (MrlBehavior
		loadWithMrlParameterAndMrlReturnValuesWhere: [ :function | 
			function behavior_name = functionUnderTest name
				AND: [ function pwb_object = functionUnderTest parentType name ] ])
		anyOne behaviorUnderTest: functionUnderTest
]

{ #category : #accessing }
MrlPWBUnitTest >> name [
	name ifNil: [ name := 'test_' , functionUnderTest name ].
	^ name
]

{ #category : #accessing }
MrlPWBUnitTest >> name: aString [ 
	name := aString
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
			assertions
				do: [ :assert | assert printPWBDeclarationScriptOn: stream ].
			stream
				<< self end;
				crlf ]
]

{ #category : #printing }
MrlPWBUnitTest >> printPWBDeclarationScriptOn: stream [
	stream
		<< self begin;
		crlf.
	assertions
		do: [ :assert | assert printPWBDeclarationScriptOn: stream ].
	stream
		<< self end;
		crlf.
	^ stream
]

{ #category : #printing }
MrlPWBUnitTest >> printPWBObjectCreationOn: aStream [
	| localVar |
	self loadTestData.
	localVar := 'l_' , self testsData pwb_object.
	^ aStream
		<< self testsData pwb_object;
		space;
		<< localVar;
		crlf;
		<< localVar;
		space;
		<< '=';
		space;
		<< 'create';
		space;
		<< self testsData pwb_object;
		crlf
]

{ #category : #printing }
MrlPWBUnitTest >> printReturnValueDeclarationOn: stream [
	^ stream
		<< testsData returnType;
		space;
		<< 'l_result';
		crlf
]

{ #category : #accessing }
MrlPWBUnitTest >> testsData [
	testsData ifNil: [ self loadTestData ].
	^ testsData
]
