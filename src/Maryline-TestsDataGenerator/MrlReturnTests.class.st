Class {
	#name : #MrlReturnTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #running }
MrlReturnTests >> setUp [
	famixModel := FamixPWBModel new
]

{ #category : #running }
MrlReturnTests >> testBeforeLogIsCorrect [
	| testFunction testParameter log |
	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType:
			(FamixPWBUserObject new
				name: 'testObject';
				mooseModel: famixModel;
				yourSelf).
	testParameter := FamixPWBParameter new
		behavioral: testFunction;
		name: 'testParameter'.
	log := String
		streamContents: [ :stream | 
			MrlParameterLogger new
				tag: 'before';
				focus: testParameter;
				logOn: stream ].
	self assert: log equals: 'f_mrl_logger().invocation_parameter_logger().log("testParameter",testParameter,"testObject","testFunction","before")
'
]
