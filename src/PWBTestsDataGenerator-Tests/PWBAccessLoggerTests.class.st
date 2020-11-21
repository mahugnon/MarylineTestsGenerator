Class {
	#name : #PWBAccessLoggerTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBAccessLoggerTests >> setUp [
	famixModel := FamixPWBModel new
]

{ #category : #running }
PWBAccessLoggerTests >> testAfterLogIsCorrect [
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
		variable: testVariable.
	log := String
		streamContents: [ :stream | 
			PWBAccessLogger new
				tag: 'after';
				focus: testAccess;
				logOn: stream ].
	self assert: log equals: 'f_mrl_logger().access_logger().log(testVariable,"testVariable","testObject","after","testFunction","testObject",ls_time);	'
]

{ #category : #running }
PWBAccessLoggerTests >> testBeforeLogIsCorrect [
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
		variable: testVariable.
	log := String
		streamContents: [ :stream | 
			PWBAccessLogger new
				tag: 'before';
				focus: testAccess;
				logOn: stream ].
	self assert: log equals: 'f_mrl_logger().access_logger().log(testVariable,"testVariable","testObject","before","testFunction","testObject",ls_time);	'
]

{ #category : #running }
PWBAccessLoggerTests >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBAccessLogger  new startOn: stream ].
	self assert: log equals:'f_mrl_logger().access_logger().log('
]
