Class {
	#name : #InsertLogInFunction,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #tests }
InsertLogInFunction >> testInsertParametersBeforeLog [
	self
		assert: testFunction2 insertParametersBeforeLog
		equals:
			'private function integer f_del_ligne_suite(datawindow adw_param, long al_param, boolean ab_param)
f_mrl_logger().invocation_parameter_logger().log("adw_param",adw_param,"testPWBOject1","f_del_ligne_suite","before")
f_mrl_logger().invocation_parameter_logger().log("al_param",al_param,"testPWBOject1","f_del_ligne_suite","before")
f_mrl_logger().invocation_parameter_logger().log("ab_param",ab_param,"testPWBOject1","f_del_ligne_suite","before")

uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
end function'
]

{ #category : #tests }
InsertLogInFunction >> testInsertReturnLog [
	self
		assert: (testFunction3 insertReturnLogIn: testFunction3 sourceText)
		equals: 'private function integer aFunctionWithParam (int ai_arg1, Long al_arg2);
f_mrl_logger().return_value_logger().log(1,"aFunctionWithParam","testPWBOject1")
return 1
'
]
