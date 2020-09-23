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
MrlPWBUnitTestForFunctionWithDatawindowArguments >> printPWBDeclarationScriptOn: stream [
	self loadTestData.
	self createAssertionsFromData.
	self beginOn: stream.
	"self printAccessSetUpOn: stream."
	self printPWBObjectCreationOn: stream.
	self newMarylineTestWindowOn: stream.
	self printReturnValueDeclarationOn: stream.
	self printParameterDeclarationOn: stream.
	assertions
		do: [ :assert | assert printPWBDeclarationScriptOn: stream ].
	self endOn: stream.
	^ stream
]

{ #category : #printing }
MrlPWBUnitTestForFunctionWithDatawindowArguments >> printParameterDeclarationOn: stream [
	self functionUnderTest parameters
		do: [ :param | 
			param isPWBDataWindow
				ifFalse: [ stream
						<< param parameterType name;
						space;
						<< param name;
						crlf ] ].
	^ stream
]
