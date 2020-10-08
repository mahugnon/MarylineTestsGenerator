Class {
	#name : #InsertLogInFunction,
	#superclass : #MRLAbstractTests,
	#instVars : [
		'function1Parameter1',
		'function1Parameter2',
		'function1Parameter3',
		'signatureFunction1'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #'as yet unclassified' }
InsertLogInFunction >> exampleFunctionSource [
	^ 'public function integer testFunction (boolean ab_maj); /* some comment */
  return LLONG
end function

//private function string aFunctionWithParam (int ai_arg1, Long al_arg2);
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
	model := FamixPWBModel new.
	
	self setUpPWBTestObjects.
	self setUpFunction.
	self setUpParameters 
]

{ #category : #running }
InsertLogInFunction >> setUpFunction [

	testFunction1 := FamixPWBFunction new
		name: 'testFunction';
		parentType: testPWBOject1 ;
		mooseModel: model ;
		yourself.

	signatureFunction1 := FamixPWBBehaviorSignature new
		mooseModel: model ;
		behavioral: testFunction1 ;
		yourself

]

{ #category : #running }
InsertLogInFunction >> setUpParameters [

	function1Parameter1 := FamixPWBParameter new
		name: 'adw_dlq';
		mooseModel: model;
		behavioral: testFunction1.

	function1Parameter2 := FamixPWBParameter new
		name: 'al_lig';
		mooseModel: model;
		behavioral: testFunction1.

	function1Parameter3 := FamixPWBParameter new
		name: 'ab_maj';
		mooseModel: model;
		behavioral: testFunction1.

]

{ #category : #running }
InsertLogInFunction >> tearDown [ 
	"voiding parent's tearDown"
]

{ #category : #tests }
InsertLogInFunction >> testInsert2ParameterBefore [
	| codeWithoutLog codeWithLogs sourceAnchor |

	codeWithoutLog := 'public function integer testFunction (long al_lig, boolean ab_maj);
  return LLONG
end function'.

	sourceAnchor := FAMIXSourceTextAnchor
		source: codeWithoutLog.
	testFunction1 sourceAnchor: sourceAnchor.
	
	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (long al_lig, boolean ab_maj);'.
	signatureFunction1 sourceAnchor: sourceAnchor.
	
	codeWithLogs := testFunction1
		insertBeforeLogsOfVariables: { function1Parameter2 . function1Parameter3 }
		in: codeWithoutLog.

	self
		assert: codeWithLogs
		equals:
		'public function integer testFunction (long al_lig, boolean ab_maj);
f_mrl_logger().invocation_parameter_logger().log("al_lig",al_lig,"testPWBOject1","testFunction","before")
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject1","testFunction","before")


  return LLONG
end function'
]

{ #category : #tests }
InsertLogInFunction >> testInsertParameterBefore [
	| codeWithLogs sourceAnchor |

	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (boolean ab_maj); /* some comment */
  return LLONG
end function'.
	testFunction1 sourceAnchor: sourceAnchor.
	
	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (boolean ab_maj);'.
	signatureFunction1 sourceAnchor: sourceAnchor.
	
	codeWithLogs := testFunction1
		insertBeforeLogsOfVariables: { function1Parameter3 }
		in: 'public function integer testFunction (boolean ab_maj); /* some comment */
  return LLONG
end function
'.

	self
		assert: codeWithLogs
		equals:
		'public function integer testFunction (boolean ab_maj);
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject1","testFunction","before")

 /* some comment */
  return LLONG
end function
'
]

{ #category : #tests }
InsertLogInFunction >> testSignatureInComment [
	| codeWithoutLog codeWithLogs sourceAnchor |

	codeWithoutLog := '/*	public function integer testFunction (boolean ab_maj);*/
	public function integer testFunction (boolean ab_maj);
  return LLONG
end function'.

	sourceAnchor := FAMIXSourceTextAnchor
		source: (codeWithoutLog copyFrom: 62 to: 143).
	testFunction1 sourceAnchor: sourceAnchor.
	
	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (boolean ab_maj);'.
	signatureFunction1 sourceAnchor: sourceAnchor.
	
	codeWithLogs := testFunction1
		insertBeforeLogsOfVariables: { function1Parameter3 }
		in: codeWithoutLog.

	self
		assert: codeWithLogs
		equals:
		'/*	public function integer testFunction (boolean ab_maj);*/
	public function integer testFunction (boolean ab_maj);
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject1","testFunction","before")


  return LLONG
end function'
]
