Class {
	#name : #MRLQueriesTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-Tests'
}

{ #category : #tests }
MRLQueriesTests >> testQueryInvocationArguments [
	self
		assertCollection:
			((QueryInvocationArguments runOn: testInvocation1)
				collect: #argumentString)
		hasSameElements:
			(MRLQueryResults
				withAll: {'adw_dlq' . 'al_lig' . 'is_col_dec <> "dlq_rel"'})
]
