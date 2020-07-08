Class {
	#name : #MRLInvocationArgumentTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-Tests'
}

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlAfterLogString [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation) first
				mrlAfterLogString
		equals: 'f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-f_del_ligne_suite")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlBeforeLogString [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation) first
				mrlBeforeLogString
		equals:
			'f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-f_del_ligne_suite")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testSaveMrlLogStrings [
	| argument |
	argument := (QueryInvocationArguments runOn: testInvocation) first.
	argument saveMrlLogStrings.
	self
		assert: argument sender sourceText
		equals:
			'private function integer aFunction ();
  long lLong
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-f_del_ligne_suite")
	var.isNull()
  anotherFunction(2, "blah")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-f_del_ligne_suite")

  return LLONG
end function'.
	self tearDown
]
