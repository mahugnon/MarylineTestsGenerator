Class {
	#name : #MrlPWBUnitTestForFunctionWithDatawindowArguments,
	#superclass : #MrlPWBUnitTest,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithDatawindowArguments class >> acceptFunction: aFamixPWBFunction [
	^ aFamixPWBFunction parameters isNotEmpty
		and: [ aFamixPWBFunction parameters anySatisfy: #isPWBDataWindow ]
]

{ #category : #'instance creation' }
MrlPWBUnitTestForFunctionWithDatawindowArguments >> newMarylineTestWindowOn: aStream [
	aStream
		<< 'w_maryline_test_window lw_maryline_test_window';
		crlf;
		<< 'open(lw_maryline_test_window)';
		crlf
]

{ #category : #printing }
MrlPWBUnitTestForFunctionWithDatawindowArguments >> printPWBDeclarationScript [
	self createAssertionsFromData.
	^ String
		streamContents: [ :stream | 
			self beginOn: stream.
			self printPWBObjectCreationOn: stream.
			self newMarylineTestWindowOn: stream.
			self printReturnValueDeclarationOn: stream.
			assertions
				do: [ :assert | stream << assert printPWBDeclarationScript ].
			self endOn: stream ]
]
