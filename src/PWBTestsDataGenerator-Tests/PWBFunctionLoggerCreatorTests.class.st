Class {
	#name : #PWBFunctionLoggerCreatorTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction',
		'testObject'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> createAccess [
	| testAttribute |
	testAttribute := FamixPWBAttribute new
		name: 'testAttribute';
		mooseModel: famixModel;
		parentType: testObject;
		yourself.
	FamixPWBAccess new
		source: testFunction;
		target: testAttribute;
		mooseModel: famixModel
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> createParameter [
	^ FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		parameterType: (FamixPWBCustomType new name: 'datawindow');
		behavioral: testFunction
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> createTestFunctions [
	testFunction := FamixPWBFunction new mooseModel: famixModel.
	FamixPWBBehaviorSignature new
		behavioral: testFunction;
		mooseModel: famixModel;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				endPos: 18).
]

{ #category : #running }
PWBFunctionLoggerCreatorTests >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	famixModel := FamixPWBModel new.
	testObject := FamixPWBUserObject new
		name: 'testObject';
		mooseModel: famixModel.
	self createTestFunctions
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateParameterAccessLoggers [
	| logCreator |
	self createAccess.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 10;
				mooseModel: famixModel;
				yourself).
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	self assert: logCreator loggers size equals: 1.
	self assert: logCreator accessLoggers anyOne position equals: 10
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateParameterAfterLoggers [
	| logCreator createdLogger |
	self createParameter.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 10;
				mooseModel: famixModel;
				yourself).
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	createdLogger := logCreator parameterLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 10.
	self assert: createdLogger tag equals: 'after'
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateParameterAfterLoggers1 [
	| logCreator |
self createParameter.
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
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	self assert: logCreator loggers size equals: 2.
	self
		assertCollection: (logCreator parameterLoggers collect: #position)
		hasSameElements: {10 . 17}
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateParameterAfterLoggers2 [
	| logCreator createdLogger parameter |
	parameter := self createParameter.
	parameter parameterType: FamixPWBBasicType new;
	parameterOption: 'ref'.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 10;
				mooseModel: famixModel;
				yourself).
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	createdLogger := logCreator loggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 10.
	self assert: createdLogger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateParameterBeforeLoggers [
	| logCreator createdLogger |
	FamixPWBParameter new
		mooseModel: famixModel;
		parameterType: FamixPWBBasicType new;
		name: 'testParameter';
		behavioral: testFunction.
	FamixPWBBehaviorSignature new
		behavioral: testFunction;
		mooseModel: famixModel;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				endPos: 18).
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'before';
		yourself.
	createdLogger := logCreator parameterLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 19.
	self assert: createdLogger tag equals: 'before'
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateParameterLoggers [
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
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createLoggers;
		yourself.
	createdLogger := logCreator returnLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger focus equals: testReturn.
	self assert: createdLogger position equals: 12
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateReturnLoggers [
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
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createLoggers;
		yourself.
	createdLogger := logCreator returnLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger focus equals: testReturn.
	self assert: createdLogger position equals: 12
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateRightLoggers [
	| logCreator |
	FamixPWBBehaviorSignature new
		behavioral: testFunction;
		mooseModel: famixModel;
		sourceAnchor: (FamixPWBIndexedFileAnchor new endPos: 2).
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		returnValue: 'false';
		sourceAnchor: (FamixPWBIndexedFileAnchor new startPos: 18).
	self createParameter.
	self createAccess.
	logCreator := PWBFunctionLoggerCreator new
		focus: testFunction;
		createLoggers;
		yourself.
	self assert: logCreator loggers size equals: 6.
	self assert: logCreator parameterLoggers size equals: 2.
	self assert: logCreator returnLoggers size equals: 1.
	self assert: logCreator accessLoggers size equals: 2
]

{ #category : #tests }
PWBFunctionLoggerCreatorTests >> testCreateTimestampLoggers [
	FamixPWBBehaviorSignature new
		behavioral: testFunction;
		mooseModel: famixModel;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				endPos: 18).
	self
		assert:
			(PWBFunctionLoggerCreator loggersFor: testFunction) anyOne
				isTimestampLogger
]
