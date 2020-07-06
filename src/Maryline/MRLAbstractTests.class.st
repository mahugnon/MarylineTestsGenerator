Class {
	#name : #MRLAbstractTests,
	#superclass : #TestCase,
	#instVars : [
		'testInvocation'
	],
	#category : #'Maryline-Tests'
}

{ #category : #'as yet unclassified' }
MRLAbstractTests >> exampleFunctionSource [
	^ 'private function integer aFunction ();
  long lLong
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
	var.isNull()
  anotherFunction(2, "blah")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")

  return LLONG
end function'
]

{ #category : #running }
MRLAbstractTests >> setUp [
	testInvocation := MRLTestMockInvocation new
		sender:
			(MRLTestMockFunction new
				name: 'aFunction';
				sourceText: self exampleFunctionSource);
		candidates: {(FamixPWBFunction new name: 'f_del_ligne_suite')}.
	testInvocation
		sourceText: 'f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")'
]
