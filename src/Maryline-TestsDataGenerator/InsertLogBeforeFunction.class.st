Class {
	#name : #InsertLogBeforeFunction,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'testPWBOject',
		'testFunction',
		'signatureFunction',
		'functionParameter2',
		'functionParameter1'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #running }
InsertLogBeforeFunction >> setUp [
	model := FamixPWBModel new.
	
	self setUpPWBTestObject.
	self setUpFunction.
	self setUpParameters.
]

{ #category : #running }
InsertLogBeforeFunction >> setUpFunction [

	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType: testPWBOject ;
		mooseModel: model ;
		yourself.

	signatureFunction := FamixPWBBehaviorSignature new
		mooseModel: model ;
		behavioral: testFunction ;
		yourself

]

{ #category : #running }
InsertLogBeforeFunction >> setUpPWBTestObject [

	testPWBOject := FamixPWBUserObject new
		mooseModel: model;
		name: 'testPWBOject1';
		yourself
]

{ #category : #running }
InsertLogBeforeFunction >> setUpParameters [

	functionParameter2 := FamixPWBParameter new
		name: 'al_lig';
		mooseModel: model;
		behavioral: testFunction.

	functionParameter1 := FamixPWBParameter new
		name: 'ab_maj';
		mooseModel: model;
		behavioral: testFunction.

]

{ #category : #tests }
InsertLogBeforeFunction >> testInsert2ParameterBefore [
	| codeWithoutLog codeWithLogs sourceAnchor |

	codeWithoutLog := 'public function integer testFunction (long al_lig, boolean ab_maj);
  return LLONG
end function'.

	sourceAnchor := FAMIXSourceTextAnchor
		source: codeWithoutLog.
	testFunction sourceAnchor: sourceAnchor.
	
	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (long al_lig, boolean ab_maj);'.
	signatureFunction sourceAnchor: sourceAnchor.
	
	codeWithLogs := testFunction
		insertBeforeLogsOfVariables: { functionParameter2 . functionParameter1 }
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
InsertLogBeforeFunction >> testInsertParameterBefore [
	| codeWithLogs sourceAnchor |

	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (boolean ab_maj); /* some comment */
  return LLONG
end function'.
	testFunction sourceAnchor: sourceAnchor.
	
	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (boolean ab_maj);'.
	signatureFunction sourceAnchor: sourceAnchor.
	
	codeWithLogs := testFunction
		insertBeforeLogsOfVariables: { functionParameter1 }
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
InsertLogBeforeFunction >> testSignatureInComment [
	| codeWithoutLog codeWithLogs sourceAnchor |

	codeWithoutLog := '/*	public function integer testFunction (boolean ab_maj);*/
	public function integer testFunction (boolean ab_maj);
  return LLONG
end function'.

	sourceAnchor := FAMIXSourceTextAnchor
		source: (codeWithoutLog copyFrom: 62 to: 143).
	testFunction sourceAnchor: sourceAnchor.
	
	sourceAnchor := FAMIXSourceTextAnchor
		source: 'public function integer testFunction (boolean ab_maj);'.
	signatureFunction sourceAnchor: sourceAnchor.
	
	codeWithLogs := testFunction
		insertBeforeLogsOfVariables: { functionParameter1 }
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
