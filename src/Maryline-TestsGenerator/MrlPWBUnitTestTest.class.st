Class {
	#name : #MrlPWBUnitTestTest,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-TestsGenerator-Tests'
}

{ #category : #tests }
MrlPWBUnitTestTest >> testEmptyTestUnitScript [
	self
		assert:
			(MrlPWBUnitTest new
				name: 'pwbTest1';
				printPWBDeclarationScript)
		equals: 
		'event pwbTest1();

return;
end event
'
]

{ #category : #tests }
MrlPWBUnitTestTest >> testGenerateUnitTestForFunction [
	| test |
	testFunction1 returnType: (FamixPWBBasicType new name: 'integer').
	test := MrlPWBUnitTest
		unitTestForInvocation:
			(FamixPWBInvocation new
				sender: testFunction2;
				candidates: {testFunction1};
				yourself).
	self
		assert: test printPWBDeclarationScript
		equals:
			'event test_aFunction();

testPWBOject1 testPWBOject1
testPWBOject1 = create testPWBOject1
this.assert( 919 = l_testPWBOject1.aFunction())
return;
end event
'
]

{ #category : #tests }
MrlPWBUnitTestTest >> testGenerateUnitTestForFunctionWithSimpleParams [
	| test |
	testFunction3 returnType: (FamixPWBBasicType new name: 'integer').
	test := MrlPWBUnitTest
		unitTestForInvocation:
			(FamixPWBInvocation new
				sender: testFunction2;
				candidates: {testFunction3};
				yourself).
	self
		assert: test printPWBDeclarationScript
		equals:
			'event test_aFunction();

testPWBOject1 testPWBOject1
testPWBOject1 = create testPWBOject1
this.assert( 919 = l_testPWBOject1.aFunction())
return;
end event
'
]

{ #category : #tests }
MrlPWBUnitTestTest >> testTestUnitForASimpleFunctionScript [
	| test1 |
	test1 := MrlPWBUnitTest new name: 'pwbTest1'.
	test1
		addVariable:
			((MrlPWBUnitTestvariable create: 'string')
				name: 'ls_var';
				beforeValue: 'baba');
					addVariable:
			((MrlPWBUnitTestvariable create: 'int')
				name: 'li_var';
				beforeValue: 5).
	self
		assert: test1 printPWBDeclarationScript
		equals:
			'event pwbTest1();

string ls_var
ls_var = "baba"
int li_var
li_var = 5
return;
end event
'
]

{ #category : #tests }
MrlPWBUnitTestTest >> testTestUnitWithPbObjectAndIntScript [
	| test1 |
	test1 := MrlPWBUnitTest new name: 'pwbTest1'.
	test1
		addVariable:
			((MrlPWBUnitTestvariable create: 'pbObject')
				name: 'l_uo_liq_cal';
				beforeValue: 'uo_liq_cal');
		addVariable:
			((MrlPWBUnitTestvariable create: 'int')
				name: 'li_var';
				beforeValue: 5).
	self
		assert: test1 printPWBDeclarationScript
		equals:
			'event pwbTest1();

uo_liq_cal l_uo_liq_cal
l_uo_liq_cal = create uo_liq_cal
int li_var
li_var = 5
return;
end event
'
]

{ #category : #tests }
MrlPWBUnitTestTest >> testTestUnitWithVariablesScript [
	| test1 |
	test1 := MrlPWBUnitTest new name: 'pwbTest1'.
	test1
		addVariable:
			((MrlPWBUnitTestvariable create: 'string')
				name: 'ls_var';
				beforeValue: 'baba');
					addVariable:
			((MrlPWBUnitTestvariable create: 'int')
				name: 'li_var';
				beforeValue: 5).
	self
		assert: test1 printPWBDeclarationScript
		equals:
			'event pwbTest1();

string ls_var
ls_var = "baba"
int li_var
li_var = 5
return;
end event
'
]
