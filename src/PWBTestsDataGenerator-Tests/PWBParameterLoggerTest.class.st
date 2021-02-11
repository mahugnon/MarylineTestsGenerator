Class {
	#name : #PWBParameterLoggerTest,
	#superclass : #TestCase,
	#instVars : [
		'testParameter'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBParameterLoggerTest >> setUp [
	| famixModel testFunction |
	super setUp.
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
PWBParameterLoggerTest >> testAterLogIsCorrect [
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
PWBParameterLoggerTest >> testBasicTypeParameterAfterLoggerISEmptyLogger [
	| logger |
	testParameter parameterType: FamixPWBBasicType new;parameterOption: 'ref'.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
PWBParameterLoggerTest >> testBasicTypeParameterAfterLoggerISEmptyLogger1 [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.
	testParameter parameterOption: 'readOnly'.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
PWBParameterLoggerTest >> testBasicTypeParameterBeforeLoggerISMrlParameterLogger [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'before'.
	self assert: logger class equals: PWBParameterLogger 
]

{ #category : #tests }
PWBParameterLoggerTest >> testBasicTypeRefParameterAfterLoggerIsMrlParameterLogger2 [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.

	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #running }
PWBParameterLoggerTest >> testBeforeLogIsCorrect [
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
PWBParameterLoggerTest >> testCustomTypeParameterLoggerIsMrlParameterLogger [
	| logger |
	testParameter parameterType: FamixPWBCustomType new.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBParameterLogger
]

{ #category : #tests }
PWBParameterLoggerTest >> testLogEndIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBParameterLogger new endOn: stream ].
	self assert: log equals: '",ls_time);	'
]

{ #category : #tests }
PWBParameterLoggerTest >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBParameterLogger new startOn: stream ].
	self assert: log equals: 'f_mrl_logger().parameter_logger().log("'
]
