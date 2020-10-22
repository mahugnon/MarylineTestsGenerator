Class {
	#name : #MrlParameterLoggerTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction',
		'testParameter'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #running }
MrlParameterLoggerTests >> setUp [
	famixModel := FamixPWBModel new.
	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType:
			(FamixPWBUserObject new
				name: 'testObject';
				mooseModel: famixModel;
				yourSelf).
	testParameter := FamixPWBParameter new
		behavioral: testFunction;
		name: 'testParameter'
]

{ #category : #running }
MrlParameterLoggerTests >> testAterLogIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | 
			MrlParameterLogger new
				tag: 'after';
				focus: testParameter;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().invocation_parameter_logger().log("testParameter",testParameter,"testObject","testFunction","after");	'
]

{ #category : #running }
MrlParameterLoggerTests >> testBeforeLogIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | 
			MrlParameterLogger new
				tag: 'before';
				focus: testParameter;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().invocation_parameter_logger().log("testParameter",testParameter,"testObject","testFunction","before");	'
]

{ #category : #tests }
MrlParameterLoggerTests >> testConstantParameterLoggerISEmptyLogger [

]

{ #category : #tests }
MrlParameterLoggerTests >> testLogEndIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | MrlParameterLogger new endOn: stream ].
	self assert: log equals: '");	'
]

{ #category : #tests }
MrlParameterLoggerTests >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | MrlParameterLogger new startOn: stream ].
	self assert: log equals: 'f_mrl_logger().invocation_parameter_logger().log("'
]
