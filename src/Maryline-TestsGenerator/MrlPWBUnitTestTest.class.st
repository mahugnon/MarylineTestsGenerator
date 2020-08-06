Class {
	#name : #MrlPWBUnitTestTest,
	#superclass : #TestCase,
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
MrlPWBUnitTestTest >> testTestUnitWithVariablesScript [
	| test1 |
	test1 := MrlPWBUnitTest new name: 'pwbTest1'.
	test1
		addVariable:
			((MrlPWBUnitTestvariable create: 'string')
				name: 'ls_var';
				value: 'baba');
					addVariable:
			((MrlPWBUnitTestvariable create: 'int')
				name: 'li_var';
				value: 5).
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
