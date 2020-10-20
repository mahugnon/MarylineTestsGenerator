Class {
	#name : #MrlFunctionLoggerCreatorTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #running }
MrlFunctionLoggerCreatorTests >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	famixModel := FamixPWBModel new
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterAfterLoggers [
	| testFunction logCreator createdLogger |
	testFunction := FamixPWBFunction new mooseModel: famixModel.
	FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		behavioral: testFunction.
	FamixPWBBehaviorSignature new
		behavioral: testFunction;
		mooseModel: famixModel;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				endPos: 18).
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	createdLogger := logCreator parameterLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 18.
	self assert: createdLogger tag equals: 'after'
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterBeforeLoggers [
	| testFunction logCreator createdLogger |
	testFunction := FamixPWBFunction new mooseModel: famixModel.
	FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		behavioral: testFunction.
	FamixPWBBehaviorSignature new
		behavioral: testFunction;
		mooseModel: famixModel;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				endPos: 18).
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'before';
		yourself.
	createdLogger := logCreator parameterLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 18.
	self assert: createdLogger tag equals: 'before'
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterLoggers [
	| testFunction logCreator testReturn  createdLogger |
	testFunction := FamixPWBFunction new mooseModel: famixModel.
	testReturn := FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				startPos: 12;
				yourself);
		returnValue: 'false'.
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createLoggers;
		yourself.
	createdLogger := logCreator returnLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger focus equals: testReturn.
	self assert: createdLogger position equals: 12
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateReturnLoggers [
	| testFunction logCreator testReturn  createdLogger |
	testFunction := FamixPWBFunction new mooseModel: famixModel.
	testReturn := FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				startPos: 12;
				yourself);
		returnValue: 'false'.
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createLoggers;
		yourself.
	createdLogger := logCreator returnLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger focus equals: testReturn.
	self assert: createdLogger position equals: 12
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateRightLoggers [
	| testFunction logCreator testReturn testParameter |
	testFunction := FamixPWBFunction new mooseModel: famixModel.
	testReturn := FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		returnValue: 'false'.
	testParameter := FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		behavioral: testFunction.
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createLoggers;
		yourself.
	self assert: logCreator loggers isNotEmpty.
	self assert: logCreator returnLoggers anyOne focus equals: testReturn.
	self
		assert: logCreator parameterLoggers anyOne focus
		equals: testParameter
]
