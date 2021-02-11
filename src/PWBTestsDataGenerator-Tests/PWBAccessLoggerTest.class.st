Class {
	#name : #PWBAccessLoggerTest,
	#superclass : #TestCase,
	#instVars : [
		'famixModel'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBAccessLoggerTest >> setUp [
	super setUp.
	famixModel := FamixPWBModel new
]

{ #category : #running }
PWBAccessLoggerTest >> testAfterLogIsCorrect [
	| testFunction testAccess log testObject testVariable |
	testObject := FamixPWBUserObject new
		name: 'testObject';
		mooseModel: famixModel.
	testVariable := FamixPWBInstanceVariable new
		name: 'testVariable';
		parentType: testObject.
	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType: testObject;
		yourself.
	testAccess := FamixPWBAccess new
		accessor: testFunction;
		variable: testVariable;
		sourceAnchor: (FAMIXSourceTextAnchor new source: 'this.testVariable').
	log := String
		streamContents: [ :stream | 
			PWBAccessLogger new
				tag: 'after';
				focus: testAccess;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().access_logger().log(this.testVariable,"testVariable","testObject","after","testFunction","testObject",ls_time);	'
]

{ #category : #running }
PWBAccessLoggerTest >> testBeforeLogDataObjectIsCorrect [
	| testFunction testAccess log testObject testVariable |
	
	testObject := FamixPWBUserObject new
		name: 'testObject';
		mooseModel: famixModel.
	testVariable := FamixPWBInstanceVariable new
		name: 'dataobject';
		parentType: testObject.
	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType: testObject;
		yourself.
	testAccess := FamixPWBAccess new
		accessor: testFunction;
		variable: testVariable;
		sourceAnchor: (FAMIXSourceTextAnchor new source: 'this.myvar.dataobject').
	log := String
		streamContents: [ :stream | 
			PWBAccessLogger new
				tag: 'before';
				focus: testAccess;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().access_logger().log(this.myvar,"myvar","testObject","before","testFunction","testObject",ls_time);	'
]

{ #category : #running }
PWBAccessLoggerTest >> testBeforeLogIsCorrect [
	| testFunction testAccess log testObject testVariable |
	testObject := FamixPWBUserObject new
		name: 'testObject';
		mooseModel: famixModel.
	testVariable := FamixPWBInstanceVariable new
		name: 'testVariable';
		parentType: testObject.
	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType: testObject;
		yourself.
	testAccess := FamixPWBAccess new
		accessor: testFunction;
		variable: testVariable;
		sourceAnchor: (FAMIXSourceTextAnchor new source: 'this.myvar.testVariable').
	log := String
		streamContents: [ :stream | 
			PWBAccessLogger new
				tag: 'before';
				focus: testAccess;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().access_logger().log(this.myvar.testVariable,"myvar.testVariable","testObject","before","testFunction","testObject",ls_time);	'
]

{ #category : #running }
PWBAccessLoggerTest >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBAccessLogger  new startOn: stream ].
	self assert: log equals:'f_mrl_logger().access_logger().log('
]
