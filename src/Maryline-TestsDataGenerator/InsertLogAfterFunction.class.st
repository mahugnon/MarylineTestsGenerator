Class {
	#name : #InsertLogAfterFunction,
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
InsertLogAfterFunction >> setUp [
	| mockFolder |
	mockFolder := Mock new.
	mockFolder stub asFileReference willReturn: mockFolder.
	(mockFolder stub resolve: Any) willReturn: mockFolder.
	mockFolder stub sourcesAreReadable willReturn: true.
	(mockFolder stub ifExists: Any	ifAbsent: Any) willReturn: true.

	model := FamixPWBModel new.
	model rootFolder: mockFolder.
	
	self setUpPWBTestObject.
	self setUpFunction.
	self setUpParameters.
	self setUpReturnInstructions
]

{ #category : #running }
InsertLogAfterFunction >> setUpFunction [

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
InsertLogAfterFunction >> setUpPWBTestObject [

	testPWBOject := FamixPWBUserObject new
		mooseModel: model;
		name: 'testPWBOject1';
		yourself
]

{ #category : #running }
InsertLogAfterFunction >> setUpParameters [

	functionParameter2 := FamixPWBParameter new
		name: 'al_lig';
		mooseModel: model;
		behavioral: testFunction.

	functionParameter1 := FamixPWBParameter new
		name: 'ab_maj';
		mooseModel: model;
		behavioral: testFunction.

]

{ #category : #running }
InsertLogAfterFunction >> setUpReturnInstructions [
	| sourceAnchor |
	sourceAnchor := FamixPWBIndexedFileAnchor new
		mooseModel: model.
		
	FamixPWBFunctionReturn new
		returnValue: 1;
		sourceAnchor: sourceAnchor ;
		behavioral: testFunction;
		mooseModel: model
]

{ #category : #tests }
InsertLogAfterFunction >> testLogAtEndNoVariable [
	| codeWithoutLog codeWithLogs sourceAnchor returnStatement |

	codeWithoutLog := 'public function integer testFunction ();
  return LLONG
end function'.

	sourceAnchor := FAMIXSourceTextAnchor
		source: codeWithoutLog.
	testFunction sourceAnchor: sourceAnchor.
	
	returnStatement := testFunction returns first.
	returnStatement sourceAnchor
		startPos: 44 ;
		endPos: 55.
	returnStatement doesBelongToSingleLineIfStatement: false.

	(model rootFolder stub binaryReadStreamDo: Any) willReturn: codeWithoutLog.
	codeWithLogs := testFunction
		insertAfterLogsOfVariables: #() 
		withReturnLogIn: codeWithoutLog.
		
	self
		assert: codeWithLogs
		equals:
		'public function integer testFunction ();
  
f_mrl_logger().return_value_logger().log(1,"testFunction","testPWBOject1")
  return LLONG
end function'
]
