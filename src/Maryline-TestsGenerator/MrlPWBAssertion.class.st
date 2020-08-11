Class {
	#name : #MrlPWBAssertion,
	#superclass : #Object,
	#instVars : [
		'expected',
		'actual'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #accessing }
MrlPWBAssertion >> actual [
	^ actual
]

{ #category : #accessing }
MrlPWBAssertion >> actual: anObject [
	actual := anObject
]

{ #category : #accessing }
MrlPWBAssertion >> expected [
	^ expected
]

{ #category : #accessing }
MrlPWBAssertion >> expected: anObject [
	expected := anObject
]

{ #category : #api }
MrlPWBAssertion >> printPWBDeclarationScript [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'this.assert(';
				space;
				<< expected;
				space;
				<< '=';
				space;
				<< actual;
				<< ')';
				crlf ]
]
