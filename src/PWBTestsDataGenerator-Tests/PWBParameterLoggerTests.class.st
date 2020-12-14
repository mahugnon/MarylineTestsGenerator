Class {
	#name : #PWBParameterLoggerTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction',
		'testParameter'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBParameterLoggerTests >> setUp [
	famixModel := FamixPWBModel new.
	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType:
			(FamixPWBUserObject new
				name: 'testObject';
				mooseModel: famixModel).
	testParameter := FamixPWBParameter new
		behavioral: testFunction;
		name: 'testParameter'
]

{ #category : #running }
PWBParameterLoggerTests >> testAterLogIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | 
			PWBParameterLogger new
				tag: 'after';
				focus: testParameter;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().parameter_logger().log("testParameter",testParameter,"testObject","testFunction","after",ls_time);	'
]

{ #category : #tests }
PWBParameterLoggerTests >> testBasicTypeParameterAfterLoggerISEmptyLogger [
	| logger |
	testParameter parameterType: FamixPWBBasicType new;parameterOption: 'ref'.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
PWBParameterLoggerTests >> testBasicTypeParameterAfterLoggerISEmptyLogger1 [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.
	testParameter parameterOption: 'readOnly'.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
PWBParameterLoggerTests >> testBasicTypeParameterBeforeLoggerISMrlParameterLogger [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'before'.
	self assert: logger class equals: PWBParameterLogger 
]

{ #category : #tests }
PWBParameterLoggerTests >> testBasicTypeRefParameterAfterLoggerIsMrlParameterLogger2 [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.

	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #running }
PWBParameterLoggerTests >> testBeforeLogIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | 
			PWBParameterLogger new
				tag: 'before';
				focus: testParameter;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().parameter_logger().log("testParameter",testParameter,"testObject","testFunction","before",ls_time);	'
]

{ #category : #tests }
PWBParameterLoggerTests >> testCustomTypeParameterLoggerIsMrlParameterLogger [
	| logger |
	testParameter parameterType: FamixPWBCustomType new.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBParameterLogger
]

{ #category : #tests }
PWBParameterLoggerTests >> testLogEndIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBParameterLogger new endOn: stream ].
	self assert: log equals: '",ls_time);	'
]

{ #category : #tests }
PWBParameterLoggerTests >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBParameterLogger new startOn: stream ].
	self assert: log equals: 'f_mrl_logger().parameter_logger().log("'
]
