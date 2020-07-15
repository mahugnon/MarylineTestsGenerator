Class {
	#name : #MrlTestCasesGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#category : #'Maryline-TestsGenerator-Tests'
}

{ #category : #running }
MrlTestCasesGeneratorTest >> setUp [
	generator := MrlTestCasesGenerator new
]

{ #category : #tests }
MrlTestCasesGeneratorTest >> testGenerateTestCaseFooter [
	generator entityName: 'Test1'.
	generator entitySuper: 'TestCase'.
	self
		assert: generator  generate footer 
		equals:
			'on Test1.create
call super::create
end on

on Test1.destroy
call super::destroy
end on
'
]

{ #category : #tests }
MrlTestCasesGeneratorTest >> testGenerateTestCaseHeader [
	generator entityName: 'Test1'.
	generator entitySuper: 'TestCase'.
	self
		assert: generator  generate header 
		equals:
			'$PBExportHeader$Test1.sru
forward
global type Test1 from TestCase
end type
end forward
'
]

{ #category : #tests }
MrlTestCasesGeneratorTest >> testGenerateVariables [
	| mrlTestCase |
	mrlTestCase := MrlTestCase new.
	mrlTestCase
		addVariable:
			(MrlPWBVariable new
				visibility: 'private';
				typeName: 'w_remise_cheque';
				name: 'iw_remise_cheque';
				yourself).
	self
		assert: mrlTestCase generateVariables
		equals:
			'type variables

private:
w_remise_cheque iw_remise_cheque

end variables'
]

{ #category : #tests }
MrlTestCasesGeneratorTest >> testMrlGeneratorChooseTheRightTemplate [
	generator entitySuper: 'TestCase'.
	self assert: (generator generate isKindOf: MrlTestCase)
]
