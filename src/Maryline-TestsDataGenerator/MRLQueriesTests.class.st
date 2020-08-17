Class {
	#name : #MRLQueriesTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #tests }
MRLQueriesTests >> testInsertMrlLogStringsForFunctionsInSource [
	testPWBOject1
		brPath:
			{testFunction1.
			testFunction2}.
	self
		assert:
			(QueryInsertMrlLogStringsForBRFunctionsInPWBObjectInSource new
				runOn: testPWBOject1) sourceText
		equals:'private function integer aFunction ();
  long lLong
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")
	var.isNull()
f_mrl_logger().log(''noe_lig'',"aFunction","testPWBOject1-5-noe_lig-before-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-before-uf_exist_col_dw")
f_mrl_logger().log(''noe_cev'',"aFunction","testPWBOject1-5-noe_cev-before-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-before-uf_exist_col_dw")
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-after-uf_exist_col_dw")
f_mrl_logger().log(''noe_cev'',"aFunction","testPWBOject1-5-noe_cev-after-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-after-uf_exist_col_dw")
f_mrl_logger().log(''noe_lig'',"aFunction","testPWBOject1-5-noe_lig-after-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")

  return LLONG
end function

private function integer f_del_ligne_suite(datawindow adw_param, long al_param, boolean ab_param)
f_mrl_logger().log(''noe_cev'',"f_del_ligne_suite","testPWBOject1-12-noe_cev-before-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"f_del_ligne_suite","testPWBOject1-12-adw_dlq-before-uf_exist_col_dw")
uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log(adw_dlq,"f_del_ligne_suite","testPWBOject1-12-adw_dlq-after-uf_exist_col_dw")
f_mrl_logger().log(''noe_cev'',"f_del_ligne_suite","testPWBOject1-12-noe_cev-after-uf_exist_col_dw")
end function'
			.
	self tearDown
]

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

{ #category : #tests }
MRLQueriesTests >> testSaveMrlLogStringsForArgumentsInAnchor [
	self
		assert:
			(QueryMrlLogStringsForInvocationInAnchor new
				runOn: testInvocation1
				with: testFunction1 sourceText)
		equals:'private function integer aFunction ();
  long lLong
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")
	var.isNull()
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")

  return LLONG
end function'
			.
	self tearDown
]

{ #category : #tests }
MRLQueriesTests >> testSaveMrlLogStringsForFunctionAlterFileInAnchor [
	| file |
	file := testFunction1 sourceAnchor rootFolder asFileReference
		resolve: testFunction1 sourceAnchor fileName.
	QueryMrlLogStringsForFunctionInAnchor new
		alterFile: true;
		runOn: testFunction1.
	self
		assert: file contents
		equals:'private function integer aFunction ();
  long lLong
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")
	var.isNull()
f_mrl_logger().log(''noe_lig'',"aFunction","testPWBOject1-5-noe_lig-before-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-before-uf_exist_col_dw")
f_mrl_logger().log(''noe_cev'',"aFunction","testPWBOject1-5-noe_cev-before-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-before-uf_exist_col_dw")
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-after-uf_exist_col_dw")
f_mrl_logger().log(''noe_cev'',"aFunction","testPWBOject1-5-noe_cev-after-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-after-uf_exist_col_dw")
f_mrl_logger().log(''noe_lig'',"aFunction","testPWBOject1-5-noe_lig-after-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")

  return LLONG
end function

private function integer f_del_ligne_suite(datawindow adw_param, long al_param, boolean ab_param)
uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
end function

private function integer aFunctionWithParam (int ai_arg1, Long al_arg2);
return1'
.
	self tearDown
]

{ #category : #tests }
MRLQueriesTests >> testSaveMrlLogStringsForInvocationsInAnchor [
	self
		assert: (QueryMrlLogStringsForFunctionInAnchor runOn: testFunction1)
		equals:
		'private function integer aFunction ();
  long lLong
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")
	var.isNull()
f_mrl_logger().log(''noe_lig'',"aFunction","testPWBOject1-5-noe_lig-before-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-before-uf_exist_col_dw")
f_mrl_logger().log(''noe_cev'',"aFunction","testPWBOject1-5-noe_cev-before-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-before-uf_exist_col_dw")
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-after-uf_exist_col_dw")
f_mrl_logger().log(''noe_cev'',"aFunction","testPWBOject1-5-noe_cev-after-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-5-adw_dlq-after-uf_exist_col_dw")
f_mrl_logger().log(''noe_lig'',"aFunction","testPWBOject1-5-noe_lig-after-uf_exist_col_dw")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-before-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-before-f_del_ligne_suite")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(is_col_dec <> "dlq_rel","aFunction","testPWBOject1-3-is_col_dec_isDifferentFrom_dlq_rel-after-f_del_ligne_suite")
f_mrl_logger().log(al_lig,"aFunction","testPWBOject1-3-al_lig-after-f_del_ligne_suite")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_dlq-after-f_del_ligne_suite")

  return LLONG
end function'	.
	self tearDown
]
