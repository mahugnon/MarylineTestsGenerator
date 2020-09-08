Class {
	#name : #MrlTestCase,
	#superclass : #Object,
	#instVars : [
		'testUnits',
		'behaviorUnderTest',
		'globalTypes'
	],
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #tests }
MrlTestCase class >> testCaseForFunction: aFamixPWBFunction [
	^ self new
		behaviorUnderTest: aFamixPWBFunction;
		printPWBDeclarationScript
]

{ #category : #adding }
MrlTestCase >> addUnitTest: aUnitTest [
	testUnits add: aUnitTest
]

{ #category : #accessing }
MrlTestCase >> behaviorUnderTest [
	^ behaviorUnderTest
]

{ #category : #accessing }
MrlTestCase >> behaviorUnderTest: anObject [
	behaviorUnderTest := anObject.
	self
		addUnitTest: (MrlPWBUnitTest unitTestForFunction: behaviorUnderTest)
]

{ #category : #tests }
MrlTestCase >> fileDeclaredType [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'global type';
				space;
				<< self name;
				space;
				<< 'from';
				space;
				<< 'testcase';
				crlf;
				<< 'event';
				space;
				<< self testCaseName;
				space;
				<< '()';
				crlf;
				<< 'end type';
				crlf;
				<< 'global';
				space;
				<< self name;
				space;
				<< self name;
				crlf ]
]

{ #category : #tests }
MrlTestCase >> forword [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'forward';
				crlf;
				<< 'global type ';
				<< self name;
				space;
				<< 'from';
				space;
				<< 'testcase';
				crlf;
				<< 'end type';
				crlf;
				<< 'end forward';
				crlf ]
]

{ #category : #printing }
MrlTestCase >> initialize [
	super initialize.
	testUnits := OrderedCollection new
]

{ #category : #tests }
MrlTestCase >> name [
	^ 'test_' , behaviorUnderTest name , '_case'
]

{ #category : #tests }
MrlTestCase >> onCreate [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'on';
				space;
				<< self name;
				<< '.create';
				crlf;
				<< 'call super::create';
				crlf;
				<< 'end on' ]
]

{ #category : #tests }
MrlTestCase >> onDestroy [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'on';
				space;
				<< self name;
				<< '.destroy';
				crlf;
				<< 'call super::destroy';
				crlf;
				<< 'end on' ]
]

{ #category : #printing }
MrlTestCase >> printPWBDeclarationScript [
	^ ('/Users/honore/Documents/IzyVersions/' , self name , '.sru')
		asFileReference
		writeStreamDo: [ :stream | 
			stream
				<< self testFileHeader;
				<< self forword;
				<< self fileDeclaredType;
				crlf.
			testUnits
				do: [ :units | 
					units printPWBDeclarationScriptOn: stream.
					stream crlf ].
			stream
				<< self onCreate;
				crlf;
				<< self onDestroy ]
]

{ #category : #tests }
MrlTestCase >> testCaseName [
	^ 'test_' , behaviorUnderTest name
]

{ #category : #tests }
MrlTestCase >> testFileHeader [
	^ String
		streamContents: [ :stream | 
			stream
				nextPut: $$;
				<< 'PBExportHeader';
				<< $$;
				<< self name;
				<< '.sru';
				crlf ]
]
