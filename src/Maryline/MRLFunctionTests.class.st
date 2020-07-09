Class {
	#name : #MRLFunctionTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-Tests'
}

{ #category : #tests }
MRLFunctionTests >> testSaveMrlLogStringsForArgumentsInAnchor [
	testInvocation1 saveMrlLogStringsForArgumentsInAnchor.
	self
		assert: testInvocation1 sender sourceText
		equals:
			'private function integer aFunction ();
  long lLong
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-before-f_del_ligne_suite")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-after-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-after-f_del_ligne_suite")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-f_del_ligne_suite")
	var.isNull()
  anotherFunction(2, "blah")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-before-f_del_ligne_suite")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-after-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-after-f_del_ligne_suite")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-f_del_ligne_suite")

  return LLONG
end function'.
	self tearDown
]

{ #category : #tests }
MRLFunctionTests >> testSaveMrlLogStringsForInvocationsInAnchor [
	testFunction1 saveMrlLogStringsForInvocationsInAnchor.
	self
		assert: testFunction1 sourceText
		equals:
			'private function integer aFunction ();
  long lLong
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-before-f_del_ligne_suite")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-after-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-after-f_del_ligne_suite")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-f_del_ligne_suite")
	var.isNull()
  anotherFunction(2, "blah")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-before-f_del_ligne_suite")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_log().log(is_col_dec <> "dlq_rel","aFunction","is_col_dec <> "dlq_rel"-after-f_del_ligne_suite")
f_mrl_log().log(al_lig,"aFunction","al_lig-after-f_del_ligne_suite")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-f_del_ligne_suite")

  return LLONG
end function'.
	self tearDown
]
