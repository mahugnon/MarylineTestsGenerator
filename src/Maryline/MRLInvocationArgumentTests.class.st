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
		equals: 'f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-aFunction")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlBeforeLogString [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation) first
				mrlBeforeLogString
		equals:
			'f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-aFunction")'
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
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-aFunction")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-aFunction")
	var.isNull()
  anotherFunction(2, "blah")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-aFunction")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-aFunction")

  return LLONG
end function'.
	self tearDown
]

{ #category : #tests }
MRLInvocationArgumentTests >> testSaveMrlLogStrings2 [
	testInvocation saveMrlLogStringsForArgumentsInAnchor.
	self
		assert: testInvocation sender sourceText
		equals:
			'private function integer aFunction ();
  long lLong
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-aFunction")
f_mrl_log().log(al_lig,"aFunction","al_lig-before-aFunction")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-before-aFunction")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-after-aFunction")
f_mrl_log().log(al_lig,"aFunction","al_lig-after-aFunction")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-aFunction")
	var.isNull()
  anotherFunction(2, "blah")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-aFunction")
f_mrl_log().log(al_lig,"aFunction","al_lig-before-aFunction")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-before-aFunction")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-after-aFunction")
f_mrl_log().log(al_lig,"aFunction","al_lig-after-aFunction")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-aFunction")

  return LLONG
end function'.
	self tearDown
]
