Class {
	#name : #MrlObjectLoggerCreatorTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction1',
		'testObject',
		'testFunction2'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #running }
MrlObjectLoggerCreatorTests >> createAccesses [
	| testAttribute |
	testAttribute := FamixPWBAttribute new
		name: 'testAttribute';
		mooseModel: famixModel;
		parentType: testObject;
		yourself.
	FamixPWBAccess new
		source: testFunction2;
		target: testAttribute;
		mooseModel: famixModel
]

{ #category : #running }
MrlObjectLoggerCreatorTests >> createFunctions [
	testFunction1 := FamixPWBFunction new
		name: 'testfunction1';
		parentType: testObject;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 1;
				endPos: 70).
	testFunction2 := FamixPWBFunction new
		name: 'testfunction2';
		parentType: testObject;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 73;
				endPos: 220)
]

{ #category : #running }
MrlObjectLoggerCreatorTests >> createParameters [
	FamixPWBParameter new
		name: 'testParameter1';
		parameterType:
			(FamixPWBBasicType new
				name: 'long';
				yourself);
		behavioral: testFunction2.
	FamixPWBParameter new
		name: 'testParameter2';
		parameterType:
			(FamixPWBBasicType new
				name: 'string';
				yourself);
		behavioral: testFunction2
]

{ #category : #running }
MrlObjectLoggerCreatorTests >> createReturns [
	FamixPWBFunctionReturn new
		behavioral: testFunction1;
		sourceAnchor: (FamixPWBIndexedFileAnchor new startPos: 46);
		returnValue: 'LLONG'.
	FamixPWBFunctionReturn new
		behavioral: testFunction2;
		sourceAnchor: (FamixPWBIndexedFileAnchor new startPos: 201);
		returnValue: 0.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction2;
		returnValue: 1;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 192;
				mooseModel: famixModel;
				yourself)
]

{ #category : #running }
MrlObjectLoggerCreatorTests >> createSignatures [
	FamixPWBBehaviorSignature new
		mooseModel: famixModel;
		behavioral: testFunction2;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 73;
				endPos: 156).
	FamixPWBBehaviorSignature new
		mooseModel: famixModel;
		behavioral: testFunction1;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 1;
				endPos: 42)
]

{ #category : #running }
MrlObjectLoggerCreatorTests >> setUp [
	famixModel := FamixPWBModel new.
	testObject := FamixPWBUserObject new
		name: 'testObject1';
		mooseModel: famixModel;
		sourceAnchor: (FAMIXSourceTextAnchor new source: self sourceExample).
	self createFunctions.
	self createReturns.
	self createSignatures.
	self createAccesses.
	self createParameters.
	famixModel
		setBusinessRuleFunctions:
			{(testObject
				->
					{testFunction1.
					testFunction2})} asOrderedDictionary
]

{ #category : #running }
MrlObjectLoggerCreatorTests >> sourceExample [
	^ 'private function integer testFunction1 ();
  return LLONG
end function

private function integer testFunction2 (long testParameter1, string testParameter2); 
this.ilong = 0
 if aLong >0 then return 1
retun 0
end function'
]

{ #category : #'as yet unclassified' }
MrlObjectLoggerCreatorTests >> sourceexampleWithLogs [
^'private function integer testFunction1 ();
  	f_mrl_logger().return_value_logger().log(LLONG,"testfunction1","testObject1");	return LLONG
end function

private function integer testFunction2 (long testParameter1, string testParameter2);	f_mrl_logger().invocation_parameter_logger().log("testParameter1",testParameter1,"testObject1","testfunction2","before");	f_mrl_logger().invocation_parameter_logger().log("testParameter2",testParameter2,"testObject1","testfunction2","before");	f_mrl_logger().access_logger().log(testAttribute,"testAttribute","testObject1","before","testfunction2","testObject1");	 
this.ilong = 0
 if aLong >0 then 	f_mrl_logger().invocation_parameter_logger().log("testParameter1",testParameter1,"testObject1","testfunction2","after");	f_mrl_logger().invocation_parameter_logger().log("testParameter2",testParameter2,"testObject1","testfunction2","after");	f_mrl_logger().access_logger().log(testAttribute,"testAttribute","testObject1","after","testfunction2","testObject1");	f_mrl_logger().return_value_logger().log(1,"testfunction2","testObject1");	return 1
	f_mrl_logger().invocation_parameter_logger().log("testParameter1",testParameter1,"testObject1","testfunction2","after");	f_mrl_logger().invocation_parameter_logger().log("testParameter2",testParameter2,"testObject1","testfunction2","after");	f_mrl_logger().access_logger().log(testAttribute,"testAttribute","testObject1","after","testfunction2","testObject1");	f_mrl_logger().return_value_logger().log(0,"testfunction2","testObject1");	retun 0
end function'
]

{ #category : #tests }
MrlObjectLoggerCreatorTests >> testCreateObjectLoggers [
	| logger |
	logger := MrlObjectLogsCreator loggerWithAccessFor: testObject.
	self assert: logger loggers values flatten size equals: 12
]

{ #category : #tests }
MrlObjectLoggerCreatorTests >> testCreateObjectsLogger [
	| logger |
	logger := MrlObjectsLogsCreator loggerWithAccessFor: {testObject}.
	self assert: logger loggers size equals: 1
]

{ #category : #tests }
MrlObjectLoggerCreatorTests >> testPrintObjectLogs [
	| logger |
	logger := MrlObjectLogsCreator loggerWithAccessFor: testObject.
	self
		assert: logger completeSourceWithLogs
		equals: self sourceexampleWithLogs
]

{ #category : #'as yet unclassified' }
MrlObjectLoggerCreatorTests >> testsAddNumberOfLoggersConstraint [
	| logger |
	logger := MrlObjectLogsCreator loggerWithAccessFor: testObject.
	logger
		addConstraint: (MrlLogsCreatorMaxNumberOfLogsConstraint new constraint: 5).
	self assert: logger loggers values  flatten size equals: 1
]

{ #category : #'as yet unclassified' }
MrlObjectLoggerCreatorTests >> testsAddNumberOfLoggersConstraint2 [
	| logger |
	logger := MrlObjectLogsCreator loggerWithAccessFor: testObject.
	logger
		addConstraint:
			(MrlLogsCreatorMaxNumberOfLogsConstraint new
				name: 'testObject';
				constraint: 15;
				yourself).
	self assert: logger loggers values flatten size equals: 12
]

{ #category : #'as yet unclassified' }
MrlObjectLoggerCreatorTests >> testsAddSkipLargFunctionConstraint [
	| logger |
	logger := MrlObjectLogsCreator loggerWithAccessFor: testObject.
	logger
		addConstraint:
			(MrlLogsCreatorSkipBigFunctionConstraint new
				constraint: {'testfunction1'}).
	self
		assert:
		logger loggers values flatten size equals: 11
]
