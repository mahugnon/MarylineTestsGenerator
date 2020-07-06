Class {
	#name : #MRLQueriesTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-Tests'
}

{ #category : #tests }
MRLQueriesTests >> testQueryInvocationArguments [
	| testInvocation |
	testInvocation := MRLTestMockInvocation new.
	testInvocation
		sourceText: 'f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> ""dlq_rel"")'.
	self
		assertCollection: (QueryInvocationArguments runOn: testInvocation)
		hasSameElements: {'adw_dlq' . 'al_lig' . 'is_col_dec' . 'dlq_rel'}
]
