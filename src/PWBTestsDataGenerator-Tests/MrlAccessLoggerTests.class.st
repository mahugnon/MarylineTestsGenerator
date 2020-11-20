Class {
	#name : #MrlAccessLoggerTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
MrlAccessLoggerTests >> setUp [
	famixModel := FamixPWBModel new
]

{ #category : #running }
MrlAccessLoggerTests >> testAfterLogIsCorrect [
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
	self assert: log equals: 'f_mrl_logger().access_logger().log(testVariable,"testVariable","testObject","after","testFunction","testObject");	'
]

{ #category : #running }
MrlAccessLoggerTests >> testBeforeLogIsCorrect [
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
	self assert: log equals: 'f_mrl_logger().access_logger().log(testVariable,"testVariable","testObject","before","testFunction","testObject");	'
]

{ #category : #running }
MrlAccessLoggerTests >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBAccessLogger  new startOn: stream ].
	self assert: log equals:'f_mrl_logger().access_logger().log('
]
