Class {
	#name : #PWBAbstractObjectLoggerCreatorTest,
	#superclass : #TestCase,
	#instVars : [
		'famixModel',
		'testFunction1',
		'testObject',
		'testFunction2',
		'logger'
	],
	#category : #'PWBTestsDataGenerator-Tests'
}

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> createAccesses [
	| testAttribute |
	testAttribute := FamixPWBAttribute new
		name: 'testAttribute';
		mooseModel: famixModel;
		parentType: testObject;
		yourself.
	FamixPWBAccess new
		source: testFunction2;
		target: testAttribute;
		mooseModel: famixModel;
		isWrite: true;
		sourceAnchor: (FAMIXSourceTextAnchor new source: 'this.testAttribute')
]

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> createFunctions [
	testFunction1 := FamixPWBFunction new
		name: 'testfunction1';
		parentType: testObject;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 1;
				endPos: 70).
	testFunction2 := FamixPWBFunction new
		name: 'testfunction2';
		parentType: testObject;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 73;
				endPos: 220)
]

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> createLogger [
	self subclassResponsibility
]

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> createParameters [
	FamixPWBParameter new
		name: 'testParameter1';
		parameterType:
			(FamixPWBBasicType new
				name: 'long';
				yourself);
		behavioral: testFunction2.
	FamixPWBParameter new
		name: 'testParameter2';
		parameterType:
			(FamixPWBBasicType new
				name: 'string';
				yourself);
		behavioral: testFunction2
]

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> createReturns [
	FamixPWBFunctionReturn new
		behavioral: testFunction1;
		sourceAnchor: (FamixPWBIndexedFileAnchor new startPos: 46);
		returnValue: 'LLONG'.
	FamixPWBFunctionReturn new
		behavioral: testFunction2;
		sourceAnchor: (FamixPWBIndexedFileAnchor new startPos: 201);
		returnValue: 0.
	FamixPWBFunctionReturn new
		mooseModel: famixModel;
		behavioral: testFunction2;
		returnValue: 1;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 192;
				mooseModel: famixModel;
				yourself)
]

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> createSignatures [
	FamixPWBBehaviorSignature new
		mooseModel: famixModel;
		behavioral: testFunction2;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 73;
				endPos: 156).
	FamixPWBBehaviorSignature new
		mooseModel: famixModel;
		behavioral: testFunction1;
		sourceAnchor:
			(FamixPWBIndexedFileAnchor new
				startPos: 1;
				endPos: 42)
]

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> setUp [
	super setUp.
	famixModel := FamixPWBModel new.
	testObject := FamixPWBUserObject new
		name: 'testObject1';
		mooseModel: famixModel;
		sourceAnchor: (FAMIXSourceTextAnchor new source: self sourceExample).
	self createFunctions.
	self createReturns.
	self createSignatures.
	self createAccesses.
	self createParameters.
	famixModel
		businessRuleFunctions:
			{(testObject
				->
					{testFunction1.
					testFunction2})} asOrderedDictionary.
	self createLogger
]

{ #category : #running }
PWBAbstractObjectLoggerCreatorTest >> sourceExample [
	^ 'private function integer testFunction1 ();
  return LLONG
end function

private function integer testFunction2 (long testParameter1, string testParameter2); 
this.ilong = 0
 if aLong >0 then return 1
retun 0
end function'
]
