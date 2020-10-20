Class {
	#name : #InsertLogBeforeFunction,
	#superclass : #TestCase,
	#instVars : [
		'logger',
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
	logger := MRLLogInsertor new.
	logger model: FamixPWBModel new.
	
	self setUpPWBTestObject.
	self setUpFunction.
	self setUpParameters.
]

{ #category : #running }
InsertLogBeforeFunction >> setUpFunction [

	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType: testPWBOject ;
		mooseModel: logger model ;
		yourself.

	signatureFunction := FamixPWBBehaviorSignature new
		mooseModel: logger model ;
		behavioral: testFunction ;
		yourself

]

{ #category : #running }
InsertLogBeforeFunction >> setUpPWBTestObject [

	testPWBOject := FamixPWBUserObject new
		mooseModel: logger model;
		name: 'testPWBOject';
		yourself
]

{ #category : #running }
InsertLogBeforeFunction >> setUpParameters [

	functionParameter2 := FamixPWBParameter new
		name: 'al_lig';
		mooseModel: logger model;
		behavioral: testFunction.

	functionParameter1 := FamixPWBParameter new
		name: 'ab_maj';
		mooseModel: logger model;
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
f_mrl_logger().invocation_parameter_logger().log("al_lig",al_lig,"testPWBOject","testFunction","before")
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject","testFunction","before")


  return LLONG
end function'
]

{ #category : #tests }
InsertLogBeforeFunction >> testInsertParameterBefore [
	| originalCode codeWithLogs sourceAnchor |

	originalCode := 'public function integer testFunction (boolean ab_maj); /* some comment */
  return LLONG
end function'.
	sourceAnchor := FamixPWBIndexedFileAnchor new
		startPos: 1 ;
		endPos:  101 ;
		yourself.
	testFunction sourceAnchor: sourceAnchor.
	
	sourceAnchor := FamixPWBIndexedFileAnchor new
		startPos: 1 ;
		endPos: 54 ;
		yourself.
	signatureFunction sourceAnchor: sourceAnchor.
	
	logger fileOriginalSource: originalCode .
	codeWithLogs := logger insertLogsBefore: testFunction forVariables: { functionParameter1 } 
		in: originalCode.

	self
		assert: codeWithLogs
		equals:
		'public function integer testFunction (boolean ab_maj);
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject","testFunction","before")

 /* some comment */
  return LLONG
end function'
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
f_mrl_logger().invocation_parameter_logger().log("ab_maj",ab_maj,"testPWBOject","testFunction","before")


  return LLONG
end function'
]
