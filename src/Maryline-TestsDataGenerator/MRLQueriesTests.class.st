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
		equals:''
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
				withAll: {'adw_param' . 'al_param' . 'ab_param'})
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
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-before-f_del_ligne_suite")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-before-f_del_ligne_suite")
f_mrl_logger().setTimestamp()
Integer l_return
l_return = f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().return_value( l_return, 3 ,"f_del_ligne_suite" )
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-after-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-after-f_del_ligne_suite")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")
	var.isNull()
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-before-f_del_ligne_suite")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-before-f_del_ligne_suite")
f_mrl_logger().setTimestamp()
Integer l_return
l_return = f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().return_value( l_return, 3 ,"f_del_ligne_suite" )
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-after-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-after-f_del_ligne_suite")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")

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
		equals:
			'private function integer aFunction ();
  long lLong
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-before-f_del_ligne_suite")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-before-f_del_ligne_suite")
f_mrl_logger().setTimestamp()
Integer l_return
l_return = f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().return_value( l_return, 3 ,"f_del_ligne_suite" )
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-after-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-after-f_del_ligne_suite")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")
	var.isNull()
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-before-aFunctionWithParam")
f_mrl_logger().log("al_arg2","aFunction","testPWBOject1-5-al_arg2-before-aFunctionWithParam")
f_mrl_logger().setTimestamp()
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-before-aFunctionWithParam")
f_mrl_logger().setTimestamp()
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-after-aFunctionWithParam")
f_mrl_logger().log("al_arg2","aFunction","testPWBOject1-5-al_arg2-after-aFunctionWithParam")
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-after-aFunctionWithParam")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-before-f_del_ligne_suite")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-before-f_del_ligne_suite")
f_mrl_logger().setTimestamp()
Integer l_return
l_return = f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().return_value( l_return, 3 ,"f_del_ligne_suite" )
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-after-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-after-f_del_ligne_suite")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")

  return LLONG
end function

private function integer f_del_ligne_suite(datawindow adw_param, long al_param, boolean ab_param)
uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
end function

private function integer aFunctionWithParam (int ai_arg1, Long al_arg2);
return 1'.
	self tearDown
]

{ #category : #tests }
MRLQueriesTests >> testSaveMrlLogStringsForInvocationsInAnchor [
	self
		assert: (QueryMrlLogStringsForFunctionInAnchor runOn: testFunction1)
		equals:
		'private function integer aFunction ();
  long lLong
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-before-f_del_ligne_suite")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-before-f_del_ligne_suite")
f_mrl_logger().setTimestamp()
Integer l_return
l_return = f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().return_value( l_return, 3 ,"f_del_ligne_suite" )
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-after-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-after-f_del_ligne_suite")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")
	var.isNull()
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-before-aFunctionWithParam")
f_mrl_logger().log("al_arg2","aFunction","testPWBOject1-5-al_arg2-before-aFunctionWithParam")
f_mrl_logger().setTimestamp()
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-before-aFunctionWithParam")
f_mrl_logger().setTimestamp()
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-after-aFunctionWithParam")
f_mrl_logger().log("al_arg2","aFunction","testPWBOject1-5-al_arg2-after-aFunctionWithParam")
f_mrl_logger().log("ai_arg1","aFunction","testPWBOject1-5-ai_arg1-after-aFunctionWithParam")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-before-f_del_ligne_suite")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-before-f_del_ligne_suite")
f_mrl_logger().setTimestamp()
Integer l_return
l_return = f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().return_value( l_return, 3 ,"f_del_ligne_suite" )
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log("ab_param","aFunction","testPWBOject1-3-ab_param-after-f_del_ligne_suite")
f_mrl_logger().log("al_param","aFunction","testPWBOject1-3-al_param-after-f_del_ligne_suite")
f_mrl_logger().log("adw_param","aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")

  return LLONG
end function'	.
	self tearDown
]
