Class {
	#name : #MrlFunctionLoggerCreatorTests,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction',
		'testObject'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> createAccess [
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
MrlFunctionLoggerCreatorTests >> createParameter [
	^ FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		parameterType: (FamixPWBCustomType new name: 'datawindow');
		behavioral: testFunction
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> createTestFunctions [
	testFunction := FamixPWBFunction new mooseModel: famixModel
]

{ #category : #running }
MrlFunctionLoggerCreatorTests >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	famixModel := FamixPWBModel new.
	testObject := FamixPWBUserObject new
		name: 'testObject';
		mooseModel: famixModel;
		yourSelf.
	self createTestFunctions
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterAccessLoggers [
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
	self createParameter.
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
MrlFunctionLoggerCreatorTests >> testCreateParameterAfterLoggers2 [
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
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'after';
		yourself.
	createdLogger := logCreator loggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 10.
	self assert: createdLogger class equals: MrlEmptyParameterLogger
]

{ #category : #tests }
MrlFunctionLoggerCreatorTests >> testCreateParameterBeforeLoggers [
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
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createVariableLoggers: 'before';
		yourself.
	createdLogger := logCreator parameterLoggers anyOne.
	self assert: logCreator loggers isNotEmpty.
	self assert: createdLogger position equals: 19.
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
	logCreator := MrlFunctionLoggerCreator new
		focus: testFunction;
		createLoggers;
		yourself.
	self assert: logCreator loggers size equals: 5.
	self assert: logCreator parameterLoggers size equals: 2.
	self assert: logCreator returnLoggers size equals: 1.
	self assert: logCreator accessLoggers size equals: 2
]
