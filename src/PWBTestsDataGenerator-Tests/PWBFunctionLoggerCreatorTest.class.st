Class {
	#name : #PWBFunctionLoggerCreatorTest,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction',
		'testObject',
		'testReturn',
		'logger'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> createAccess [
	| testAttribute |
	testAttribute := FamixPWBAttribute new
		name: 'testAttribute';
		mooseModel: famixModel;
		parentType: testObject;
		yourself.
	FamixPWBAccess new
		source: testFunction;
		target: testAttribute;
		mooseModel: famixModel;
		isWrite: true
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> createParameter [
	^ FamixPWBParameter new
		mooseModel: famixModel;
		name: 'testParameter';
		parameterType: (FamixPWBCustomType new name: 'datawindow');
		behavioral: testFunction
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> createTestFunctions [
	testFunction := FamixPWBFunction new mooseModel: famixModel.
	FamixPWBBehaviorSignature new
		behavioral: testFunction;
		mooseModel: famixModel;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				mooseModel: famixModel;
				endPos: 18).
	testReturn := FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 10;
				mooseModel: famixModel;
				yourself)
]

{ #category : #running }
PWBFunctionLoggerCreatorTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	famixModel := FamixPWBModel new.
	testObject := FamixPWBUserObject new
		name: 'testObject';
		mooseModel: famixModel.
	self createTestFunctions.
	logger := PWBFunctionLoggerCreator new focus: testFunction
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateParameterAccessLoggers [
	self createAccess.
	logger createVariableLoggers: 'after'.
	self assert: logger loggers size equals: 1.
	self assert: logger accessLoggers anyOne position equals: 10
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateParameterAfterLoggers [
	| createdLogger |
	self createParameter.
	logger createVariableLoggers: 'after'.
	createdLogger := logger parameterLoggers anyOne.
	self assert: logger loggers isNotEmpty.
	self assert: createdLogger position equals: 10.
	self assert: createdLogger tag equals: 'after'
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateParameterAfterLoggers1 [
	self createParameter.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 17;
				mooseModel: famixModel;
				yourself).
	logger createVariableLoggers: 'after'.
	self assert: logger loggers size equals: 2.
	self
		assertCollection: (logger parameterLoggers collect: #position)
		hasSameElements: {10 . 17}
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateParameterAfterLoggers2 [
	| createdLogger parameter |
	parameter := self createParameter.
	parameter
		parameterType: FamixPWBBasicType new;
		parameterOption: 'ref'.
	logger createVariableLoggers: 'after'.
	createdLogger := logger loggers anyOne.
	self assert: logger loggers isNotEmpty.
	self assert: createdLogger position equals: 10.
	self assert: createdLogger class equals: PWBEmptyParameterLogger
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateParameterBeforeLoggers [
	| createdLogger |
	FamixPWBParameter new
		mooseModel: famixModel;
		parameterType: FamixPWBBasicType new;
		name: 'testParameter';
		behavioral: testFunction.
	logger createVariableLoggers: 'before'.
	createdLogger := logger parameterLoggers anyOne.
	self assert: logger loggers isNotEmpty.
	self assert: createdLogger position equals: 19.
	self assert: createdLogger tag equals: 'before'
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateParameterLoggers [
	| createdLogger |
	logger createLoggers.
	createdLogger := logger returnLoggers anyOne.
	self assert: logger loggers isNotEmpty.
	self assert: createdLogger focus equals: testReturn.
	self assert: createdLogger position equals: 10
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateReturnLoggers [
	| createdLogger |
	logger createLoggers.
	createdLogger := logger returnLoggers anyOne.
	self assert: logger loggers isNotEmpty.
	self assert: createdLogger focus equals: testReturn.
	self assert: createdLogger position equals: 10
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateRightLoggers [
	self createParameter.
	self createAccess.
	logger createLoggers.
	self assert: logger loggers size equals: 6.
	self assert: logger parameterLoggers size equals: 2.
	self assert: logger returnLoggers size equals: 1.
	self assert: logger accessLoggers size equals: 2
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testCreateTimestampLoggers [
	self
		assert:
			(PWBFunctionLoggerCreator loggersFor: testFunction) anyOne
				isTimestampLogger
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testFunctionLogsCreatorAcceptFunction [
	self assert: (PWBFunctionLoggerCreator accept: FamixPWBFunction new).
	self deny: (PWBFunctionLoggerCreator accept: FamixPWBEvent new).
	self deny: (PWBFunctionLoggerCreator accept: FamixPWBSubRoutine new)
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testPrintOn [
	| value |
	testFunction name: 'uf_testFunction'.
	value := String streamContents: [ :stream | logger printOn: stream ].
	self assert: value equals: 'uf_testFunction (0)'
]

{ #category : #tests }
PWBFunctionLoggerCreatorTest >> testSubroutineLogsCreatorAcceptSubroutine [
	self
		assert: (PWBSubRoutineLoggerCreator accept: FamixPWBSubRoutine new).
	self deny: (PWBSubRoutineLoggerCreator accept: FamixPWBEvent new).
	self deny: (PWBSubRoutineLoggerCreator accept: FamixPWBFunction new)
]
