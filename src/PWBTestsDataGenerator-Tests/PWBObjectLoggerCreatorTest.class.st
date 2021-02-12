Class {
	#name : #PWBObjectLoggerCreatorTest,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction1',
		'testObject',
		'testFunction2'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBObjectLoggerCreatorTest >> createAccesses [
	| testAttribute |
	testAttribute := FamixPWBAttribute new
		name: 'testAttribute';
		mooseModel: famixModel;
		parentType: testObject;
		yourself.
	FamixPWBAccess new
		source: testFunction2;
		target: testAttribute;
		mooseModel: famixModel;
		isWrite: true;
		sourceAnchor: (FAMIXSourceTextAnchor new source: 'this.testAttribute')
]

{ #category : #running }
PWBObjectLoggerCreatorTest >> createFunctions [
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
PWBObjectLoggerCreatorTest >> createParameters [
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
PWBObjectLoggerCreatorTest >> createReturns [
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
PWBObjectLoggerCreatorTest >> createSignatures [
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
PWBObjectLoggerCreatorTest >> setUp [
	super setUp.
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
		businessRuleFunctions:
			{(testObject
				->
					{testFunction1.
					testFunction2})} asOrderedDictionary
]

{ #category : #running }
PWBObjectLoggerCreatorTest >> sourceExample [
	^ 'private function integer testFunction1 ();
  return LLONG
end function

private function integer testFunction2 (long testParameter1, string testParameter2); 
this.ilong = 0
 if aLong >0 then return 1
retun 0
end function'
]

{ #category : #running }
PWBObjectLoggerCreatorTest >> sourceExampleWithLogs [
	^'private function integer testFunction1 ();	
 string ls_time 
ls_time = String(DateTime(Today(), Now()),"DD/MM/YYYY HH:MM:SS:FFF")

  	f_mrl_logger().return_value_logger().log(LLONG,"testfunction1","testObject1",ls_time);	return LLONG
end function

private function integer testFunction2 (long testParameter1, string testParameter2);	
 string ls_time 
ls_time = String(DateTime(Today(), Now()),"DD/MM/YYYY HH:MM:SS:FFF")
f_mrl_logger().parameter_logger().log("testParameter2",testParameter2,"testObject1","testfunction2","before",ls_time);	f_mrl_logger().parameter_logger().log("testParameter1",testParameter1,"testObject1","testfunction2","before",ls_time);	f_mrl_logger().access_logger().log(this.testAttribute,"testAttribute","testObject1","before","testfunction2","testObject1",ls_time);	 
this.ilong = 0
 if aLong >0 then 	f_mrl_logger().access_logger().log(this.testAttribute,"testAttribute","testObject1","after","testfunction2","testObject1",ls_time);	f_mrl_logger().return_value_logger().log(1,"testfunction2","testObject1",ls_time);	return 1
	f_mrl_logger().access_logger().log(this.testAttribute,"testAttribute","testObject1","after","testfunction2","testObject1",ls_time);	f_mrl_logger().return_value_logger().log(0,"testfunction2","testObject1",ls_time);	retun 0
end function'
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testAddNumberOfLoggersConstraint [
	| logger |
	logger := PWBObjectLogsCreator loggerWithAccessFor: testObject.
	logger
		addConstraint: (PWBLogsCreatorMaxNumberOfLogsConstraint new constraint: 5).
	self assert: logger loggers size equals: 2.
	logger prepareLogs.
	self
		assert: testObject getBusinessRuleFunctions anyOne
		equals: testFunction2
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testAddNumberOfLoggersConstraint2 [
	| logger |
	logger := PWBObjectLogsCreator loggerWithAccessFor: testObject.
	logger
		addConstraint:
			(PWBLogsCreatorMaxNumberOfLogsConstraint new
				name: 'testObject';
				constraint: 15;
				yourself).
	self assert: logger loggers size equals: 14
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testAddSkipLargFunctionConstraint [
	| logger |
	logger := PWBObjectLogsCreator loggerWithAccessFor: testObject.
	logger
		addConstraint:
			(PWBLogsCreatorSkipBigFunctionConstraint new
				constraint: {'testfunction1'}).
	self assert: logger loggers size equals: 8.
	logger prepareLogs.
	self
		assert: testObject getBusinessRuleFunctions anyOne
		equals: testFunction1
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testBehaviorAreSetToLogged [
	| logger |
	logger := (PWBObjectLogsCreator loggerWithAccessFor: testObject)
		prepareLogs.
	self assert: logger loggedBehaviors anyOne isLogged.
	self assert: testObject getBusinessRuleFunctions isEmpty
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testCreateObjectLoggers [
	| logger |
	logger := PWBObjectLogsCreator loggerWithAccessFor: testObject.
	self assert: logger loggers size equals: 14
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testCreateObjectLoggersWithoutAccess [
	| logger |
	logger := PWBObjectLogsCreator loggerWithoutAccessFor: testObject.
	self assert: logger loggers size equals: 11
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testCreateObjectsLogger [
	| logger |
	logger := PWBObjectGroupLogsCreator new
		focus: {testObject};
		createwithAccessLoggers;
		yourself.
	self assert: logger loggers size equals: 1
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testLoggedBehaviors [
	| logger |
	logger := PWBObjectGroupLogsCreator new
		focus: {testObject};
		createwithAccessLoggers;
		yourself.
	self
		assertCollection: logger loggedBehaviors
		hasSameElements:
			{testFunction1.
			testFunction2}
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testPrintObjectLogs [
	| logger |
	logger := (PWBObjectLogsCreator loggerWithAccessFor: testObject)
		prepareLogs.
	self
		assert:
			(logger completeSourceWithLogs
				copyReplaceAll: String lf
				with: String cr)
		equals: self sourceExampleWithLogs
]

{ #category : #tests }
PWBObjectLoggerCreatorTest >> testPrintOn [
	| name logger |
	logger := PWBObjectGroupLogsCreator new
		focus: {testObject};
		createWithoutAccessLoggers.
	name := String streamContents: [ :stream | logger printOn: stream ].
	self assert: name equals: 'Group (1)'
]
