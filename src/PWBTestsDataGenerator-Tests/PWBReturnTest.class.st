Class {
	#name : #PWBReturnTest,
	#superclass : #TestCase,
	#instVars : [
		'famixModel'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBReturnTest >> setUp [
	super setUp.
	famixModel := FamixPWBModel new
]

{ #category : #running }
PWBReturnTest >> testLogIsCorrect [
	| testFunction testReturn log |
	testFunction := FamixPWBFunction new
		name: 'testFunction';
		parentType:
			(FamixPWBUserObject new
				name: 'testObject';
				mooseModel: famixModel).
	testReturn := FamixPWBFunctionReturn new
		behavioral: testFunction;
		returnValue: '1'.
	log := String
		streamContents: [ :stream | 
			PWBReturnLogger new
				focus: testReturn;
				logOn: stream ].
	self
		assert: log
		equals:
			'f_mrl_logger().return_value_logger().log(1,"testFunction","testObject",ls_time);	'
]

{ #category : #running }
PWBReturnTest >> testLogStartIsCorrect [
	| log |
	log := String
		streamContents: [ :stream | PWBReturnLogger  new startOn: stream ].
	self assert: log equals: 'f_mrl_logger().return_value_logger().log('
]
