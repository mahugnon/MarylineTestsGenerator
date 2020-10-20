Class {
	#name : #MrlFunctionLoggerCreatorTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> createTestFunctions [
	testFunction := FamixPWBFunction new mooseModel: famixModel
]

{ #category : #running }
MrlFunctionLoggerCreatorTests >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	famixModel := FamixPWBModel new.
	self createTestFunctions
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterAccessLoggers [
	| logCreator testAttribute testObject |
	testObject := FamixPWBUserObject new
		name: 'testObject';
		mooseModel: famixModel;
		yourSelf.
	testAttribute := FamixPWBAttribute new
		name: 'testAttribute';
		mooseModel: famixModel;
		parentType: testObject;
		yourself.
	FamixPWBAccess new
		source: testFunction;
		target: testAttribute;
		mooseModel: famixModel.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 10;
				mooseModel: famixModel;
				yourself).
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	self assert: logCreator loggers size equals: 1.
	self assert: logCreator accessLoggers anyOne position equals: 10
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterAfterLoggers [
	| logCreator createdLogger |
	FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		behavioral: testFunction.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 10;
				mooseModel: famixModel;
				yourself).
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	createdLogger := logCreator parameterLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 10.
	self assert: createdLogger tag equals: 'after'
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterAfterLoggers1 [
	| logCreator |
	FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		behavioral: testFunction.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 10;
				mooseModel: famixModel;
				yourself).
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 17;
				mooseModel: famixModel;
				yourself).
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	self assert: logCreator loggers size equals: 2.
	self
		assertCollection: (logCreator parameterLoggers collect: #position)
		hasSameElements: {10 . 17}
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterBeforeLoggers [
	| logCreator createdLogger |
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
	| logCreator testReturn createdLogger |
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
	| logCreator testReturn createdLogger |
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
