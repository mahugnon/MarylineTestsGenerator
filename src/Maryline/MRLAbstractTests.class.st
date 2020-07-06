Class {
	#name : #MRLAbstractTests,
	#superclass : #TestCase,
	#instVars : [
		'testInvocation'
	],
	#category : #'Maryline-Tests'
}

{ #category : #running }
MRLAbstractTests >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	testInvocation := MRLTestMockInvocation new
		sender: (FamixPWBFunction new name: 'TestFuctionA');
		candidates: {(FamixPWBFunction new name: 'f_del_ligne_suite')}.
	testInvocation
		sourceText: 'f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")'
]
