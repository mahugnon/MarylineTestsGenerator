Class {
	#name : #MRLFunctionTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-Tests'
}

{ #category : #tests }
MRLFunctionTests >> testSaveMrlLogStringsForArgumentsInAnchor [
	self
		assert:
			(QueryMrlLogStringsForInvocationInAnchor new
				runOn: testInvocation1
				with: self exampleFunctionSource)
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
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
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
	self
		assert: (QueryMrlLogStringsForFunctionInAnchor runOn: testFunction1)
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
f_mrl_log().log(''noe_lig'',"aFunction","''noe_lig''-before-uf_exist_col_dw")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-uf_exist_col_dw")
f_mrl_log().log(''noe_cev'',"aFunction","''noe_cev''-before-uf_exist_col_dw")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-before-uf_exist_col_dw")
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-uf_exist_col_dw")
f_mrl_log().log(''noe_cev'',"aFunction","''noe_cev''-after-uf_exist_col_dw")
f_mrl_log().log(adw_dlq,"aFunction","adw_dlq-after-uf_exist_col_dw")
f_mrl_log().log(''noe_lig'',"aFunction","''noe_lig''-after-uf_exist_col_dw")
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
