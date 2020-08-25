Class {
	#name : #MrlPWBUnitTestForFunctionWithBasicTypeArguments,
	#superclass : #MrlPWBUnitTest,
	#instVars : [
		'testsData'
	],
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

{ #category : #'as yet unclassified' }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> createAssertionsFromData [
	self loadTestData.
	assertions addAll: testsData createAssertionsFromData
]

{ #category : #'as yet unclassified' }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> loadTestData [
	testsData := (MrlBehavior
		loadWithMrlParameterAndMrlReturnValuesWhere: [ :function | 
			function behavior_name = functionUnderTest name
				AND: [ function pwb_object = functionUnderTest parentType name ] ])
		anyOne behaviorUnderTest: functionUnderTest
]

{ #category : #printing }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> printPWBDeclarationScript [
	| localVar |
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
