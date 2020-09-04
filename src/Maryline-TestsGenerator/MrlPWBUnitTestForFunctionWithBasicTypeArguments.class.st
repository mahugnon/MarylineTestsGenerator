Class {
	#name : #MrlPWBUnitTestForFunctionWithBasicTypeArguments,
	#superclass : #MrlPWBUnitTest,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithBasicTypeArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation candidates anyOne parameters
		allSatisfy: [ :param | param isBasic ]
]

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithBasicTypeArguments class >> acceptFunction: aFamixPWBFunction [
	^ aFamixPWBFunction parameters isNotEmpty
		and: [ aFamixPWBFunction parameters allSatisfy: #isBasic ]
]

{ #category : #printing }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> printPWBDeclarationScript [
	| localVar |
	self loadTestData.
	localVar := 'l_' , testsData pwb_object.
	self createAssertionsFromData.
	^ String
		streamContents: [ :stream | 
			stream
				<< self begin;
				crlf;
				<< testsData pwb_object;
				space;
				<< localVar;
				crlf;
				<< localVar;
				space;
				<< '=';
				space;
				<< 'create';
				space;
				<< testsData pwb_object;
				crlf;
				<< testsData returnType;
				space;
				<< 'l_result';
				crlf.
			assertions
				do: [ :assert | stream << assert printPWBDeclarationScript ].
			stream
				<< self end;
				crlf ]
]
