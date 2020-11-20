Class {
	#name : #MrlParameterLoggerTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction',
		'testParameter'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
MrlParameterLoggerTests >> setUp [
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
MrlParameterLoggerTests >> testAterLogIsCorrect [
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
			'f_mrl_logger().parameter_logger().log("testParameter",testParameter,"testObject","testFunction","after");	'
]

{ #category : #tests }
MrlParameterLoggerTests >> testBasicTypeParameterAfterLoggerISEmptyLogger [
	| logger |
	testParameter parameterType: FamixPWBBasicType new;parameterOption: 'ref'.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
MrlParameterLoggerTests >> testBasicTypeParameterAfterLoggerISEmptyLogger1 [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.
	testParameter parameterOption: 'readOnly'.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
MrlParameterLoggerTests >> testBasicTypeParameterBeforeLoggerISMrlParameterLogger [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'before'.
	self assert: logger class equals: PWBParameterLogger 
]

{ #category : #tests }
MrlParameterLoggerTests >> testBasicTypeRefParameterAfterLoggerIsMrlParameterLogger2 [
	| logger |
	testParameter parameterType: FamixPWBBasicType new.

	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBEmptyParameterLogger
]

{ #category : #running }
MrlParameterLoggerTests >> testBeforeLogIsCorrect [
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
			'f_mrl_logger().parameter_logger().log("testParameter",testParameter,"testObject","testFunction","before");	'
]

{ #category : #tests }
MrlParameterLoggerTests >> testCustomTypeParameterLoggerIsMrlParameterLogger [
	| logger |
	testParameter parameterType: FamixPWBCustomType new.
	logger := PWBAbstractLogger loggerFor: testParameter tag: 'after'.
	self assert: logger class equals: PWBParameterLogger
]

{ #category : #tests }
MrlParameterLoggerTests >> testLogEndIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBParameterLogger new endOn: stream ].
	self assert: log equals: '");	'
]

{ #category : #tests }
MrlParameterLoggerTests >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBParameterLogger new startOn: stream ].
	self assert: log equals: 'f_mrl_logger().parameter_logger().log("'
]
