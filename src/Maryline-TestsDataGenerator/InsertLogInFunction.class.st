Class {
	#name : #InsertLogInFunction,
	#superclass : #MRLAbstractTests,
	#instVars : [
		'sourceAnchorReturn2',
		'sourceAnchorReturn3',
		'sourceAnchorSignature1',
		'sourceAnchorSignature2'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #'as yet unclassified' }
InsertLogInFunction >> exampleFunctionSource [
	^ 'public function integer uf_calcul_autre_oc (ref uo_datawindow adw_dlq, long al_lig, boolean ab_maj);/*
	Objet UO_RESSOURCE_GAR
	uf_calcul_autre_OC()
	- Argument(s) -
	* 22/05/97 *	$cim$*/
integer li_ret
  long lLong
	var.isNull()
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
  return LLONG
end function

private function string aFunctionWithParam (int ai_arg1, Long al_arg2);
if a then return "-1"
else
return "1"
end if
end function
'
]

{ #category : #running }
InsertLogInFunction >> setUp [
	self createDirectory: self pwbLibString.
	self createFile.
	model := FamixPWBModel new.
	model rootFolder: self pwbLibString.
	self setUpPWBTestObjects.
	self setUpFunction.
	self setUpFunctionParameters.
	self setUpSignature.
	self setUpReturnType.
	self setUpReturn
]

{ #category : #running }
InsertLogInFunction >> setUpFunction [
	sourceAnchorFunction1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 1;
		endPos: 317;
		mooseModel: model.
	testFunction1 := FamixPWBFunction new
		name: 'uf_calcul_autre_oc';
		sourceAnchor: sourceAnchorFunction1;
		parentType: testPWBOject1;
		mooseModel: model.
	sourceAnchorFunction2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 320;
		endPos: 449;
		mooseModel: model.
	testFunction2 := FamixPWBFunction new
		name: 'aFunctionWithParam';
		sourceAnchor: sourceAnchorFunction2;
		parentType: testPWBOject1;
		mooseModel: model.
	model
		businessRulePath:
			(OrderedDictionary
				newFrom:
					{(testPWBOject1
						->
							{testFunction1.
							testFunction2})})
]

{ #category : #running }
InsertLogInFunction >> setUpFunctionParameters [
	| parametersourceAnchor1 parametersourceAnchor2 |
	parametersourceAnchor1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 364;
		endPos: 374;
		mooseModel: model.
	FamixPWBParameter new
		sourceAnchor: parametersourceAnchor1;
		name: 'ai_arg1';
		mooseModel: model;
		behavioral: testFunction2.
	parametersourceAnchor2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 377;
		endPos: 388;
		mooseModel: model.
	FamixPWBParameter new
		sourceAnchor: parametersourceAnchor2;
		mooseModel: model;
		name: 'al_arg2';
		behavioral: testFunction2
]

{ #category : #initialization }
InsertLogInFunction >> setUpReturn [
	sourceAnchorReturn1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 293;
		endPos: 304;
		mooseModel: model.
	FamixPWBFunctionReturn new
		returnValue: 1;
		sourceAnchor: sourceAnchorReturn1;
		behavioral: testFunction1;
		mooseModel: model.
		
		sourceAnchorReturn2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 402;
		endPos: 412;
		mooseModel: model.
	FamixPWBFunctionReturn new
		returnValue: 1;
		sourceAnchor: sourceAnchorReturn2;
		behavioral: testFunction2;
		mooseModel: model.
		
		sourceAnchorReturn3 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 419;
		endPos: 428;
		mooseModel: model.
	FamixPWBFunctionReturn new
		returnValue: 1;
		sourceAnchor: sourceAnchorReturn3;
		behavioral: testFunction2;
		mooseModel: model
]

{ #category : #initialization }
InsertLogInFunction >> setUpReturnType [
	testFunction1
		returnType:
			(FamixPWBBasicType new
				name: 'Integer';
				mooseModel: model).
	testFunction2
		returnType:
			(FamixPWBBasicType new
				name: 'String';
				mooseModel: model)
]

{ #category : #running }
InsertLogInFunction >> setUpSignature [
	sourceAnchorSignature1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 1;
		endPos: 100;
		mooseModel: model.
	sourceAnchorSignature2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 320;
		endPos: 390;
		mooseModel: model.
	FamixPWBBehaviorSignature new
		name: 'signature1';
		sourceAnchor: sourceAnchorSignature1;
		mooseModel: model;
		behavioral: testFunction1.
	FamixPWBBehaviorSignature new
		name: 'signature2';
		sourceAnchor: sourceAnchorSignature2;
		mooseModel: model;
		behavioral: testFunction2
]

{ #category : #tests }
InsertLogInFunction >> testInsertLogsInFileA [
	testPWBOject1 insertMarylineLogs.
	self
		assert: testPWBOject1 sourceAnchor fileReference contents
		equals: 'public function integer uf_calcul_autre_oc (ref uo_datawindow adw_dlq, long al_lig, boolean ab_maj);
f_mrl_logger().invocation_parameter_logger().log("adw_dlq",adw_dlq,"testPWBOject1","uf_calcul_autre_oc","before")
f_mrl_logger().invocation_parameter_logger().log("al_lig",al_lig,"testPWBOject1","uf_calcul_autre_oc","before")
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject1","uf_calcul_autre_oc","before")

/*
	Objet UO_RESSOURCE_GAR
	uf_calcul_autre_OC()
	- Argument(s) -
	* 22/05/97 *	$cim$*/
integer li_ret
  long lLong
	var.isNull()
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
  
f_mrl_logger().invocation_parameter_logger().log("adw_dlq",adw_dlq,"testPWBOject1","uf_calcul_autre_oc","after")
f_mrl_logger().invocation_parameter_logger().log("al_lig",al_lig,"testPWBOject1","uf_calcul_autre_oc","after")
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject1","uf_calcul_autre_oc","after")

f_mrl_logger().return_value_logger().log(1,"uf_calcul_autre_oc","testPWBOject1")
return LLONG

end function

private function string aFunctionWithParam (int ai_arg1, Long al_arg2);
f_mrl_logger().invocation_parameter_logger().log("ai_arg1",ai_arg1,"testPWBOject1","aFunctionWithParam","before")
f_mrl_logger().invocation_parameter_logger().log("al_arg2",al_arg2,"testPWBOject1","aFunctionWithParam","before")


if a then 
f_mrl_logger().invocation_parameter_logger().log("ai_arg1",ai_arg1,"testPWBOject1","aFunctionWithParam","after")
f_mrl_logger().invocation_parameter_logger().log("al_arg2",al_arg2,"testPWBOject1","aFunctionWithParam","after")

f_mrl_logger().return_value_logger().log(1,"aFunctionWithParam","testPWBOject1")
return "-1"

else

f_mrl_logger().invocation_parameter_logger().log("ai_arg1",ai_arg1,"testPWBOject1","aFunctionWithParam","after")
f_mrl_logger().invocation_parameter_logger().log("al_arg2",al_arg2,"testPWBOject1","aFunctionWithParam","after")

f_mrl_logger().return_value_logger().log(1,"aFunctionWithParam","testPWBOject1")
return "1"

end if
end function
'
]

{ #category : #tests }
InsertLogInFunction >> testInsertParametersAfterWithReturnLogInFileA [
	self
		assert:
			(testFunction2
				insertAfterLogOfParametersAccessesWithReturnLogIn: testFunction2 sourceAnchor completeText)
		equals: 'public function integer uf_calcul_autre_oc (ref uo_datawindow adw_dlq, long al_lig, boolean ab_maj);/*
	Objet UO_RESSOURCE_GAR
	uf_calcul_autre_OC()
	- Argument(s) -
	* 22/05/97 *	$cim$*/
integer li_ret
  long lLong
	var.isNull()
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
  return LLONG
end function

private function string aFunctionWithParam (int ai_arg1, Long al_arg2);
if a then 
f_mrl_logger().invocation_parameter_logger().log("ai_arg1",ai_arg1,"testPWBOject1","aFunctionWithParam","after")
f_mrl_logger().invocation_parameter_logger().log("al_arg2",al_arg2,"testPWBOject1","aFunctionWithParam","after")

f_mrl_logger().return_value_logger().log(1,"aFunctionWithParam","testPWBOject1")
return "-1"

else

f_mrl_logger().invocation_parameter_logger().log("ai_arg1",ai_arg1,"testPWBOject1","aFunctionWithParam","after")
f_mrl_logger().invocation_parameter_logger().log("al_arg2",al_arg2,"testPWBOject1","aFunctionWithParam","after")

f_mrl_logger().return_value_logger().log(1,"aFunctionWithParam","testPWBOject1")
return "1"

end if
end function
'
]

{ #category : #tests }
InsertLogInFunction >> testInsertParametersBeforeLogInFileA [
	self
		assert:
			(testFunction1
				insertBeforeLogsOfVariables: testFunction1 parameters
				in: testFunction1 sourceAnchor completeText)
		equals:
			'public function integer uf_calcul_autre_oc (ref uo_datawindow adw_dlq, long al_lig, boolean ab_maj);
f_mrl_logger().invocation_parameter_logger().log("adw_dlq",adw_dlq,"testPWBOject1","uf_calcul_autre_oc","before")
f_mrl_logger().invocation_parameter_logger().log("al_lig",al_lig,"testPWBOject1","uf_calcul_autre_oc","before")
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject1","uf_calcul_autre_oc","before")

/*
	Objet UO_RESSOURCE_GAR
	uf_calcul_autre_OC()
	- Argument(s) -
	* 22/05/97 *	$cim$*/
integer li_ret
  long lLong
	var.isNull()
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
  return LLONG
end function

private function string aFunctionWithParam (int ai_arg1, Long al_arg2);
if a then return "-1"
else
return "1"
end if
end function
'
]
