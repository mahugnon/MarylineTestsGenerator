Class {
	#name : #MRLInvocationArgumentTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #tests }
MRLInvocationArgumentTests >> testArgmentInvocationLineNumber [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation1) first
				invocationLineNumber
		equals: 3
]

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlAfterLogString [
	
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation1) first
				mrlAfterLogString
		equals:
			'f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlBeforeLogString [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation1) first
				mrlBeforeLogString
		equals:
	'f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlBeforeLogString1 [
	| arg |
	arg := MRLInvocationArgument new
		sender: testFunction1;
		receiver: 'uf_rech_nv_param_prev';
		argumentValue: 'PER_PAI';
		argumentName: 'myArgument'
		yourself.
	self
		assert: arg mrlBeforeLogString
		equals:
	'f_mrl_logger().log(PER_PAI,"aFunction","testPWBOject1-nil-myArgument-before-uf_rech_nv_param_prev")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testSaveMrlLogStrings [
	| argument |
	argument := (QueryInvocationArguments runOn: testInvocation1) first.

	"argument saveMrlLogStrings."
	self
		assert: (argument generateInSourceTextMrlLogStrings: testFunction1 sourceText)
		equals:'private function integer aFunction ();
  long lLong
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")
	var.isNull()
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_param-before-f_del_ligne_suite")
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
f_mrl_logger().log(adw_dlq,"aFunction","testPWBOject1-3-adw_param-after-f_del_ligne_suite")

  return LLONG
end function'
		.
	self tearDown
]
