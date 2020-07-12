Class {
	#name : #MRLAbstractTests,
	#superclass : #TestCase,
	#instVars : [
		'toDelete',
		'model',
		'testFunction1',
		'testInvocation1',
		'testInvocation2',
		'testFunction2',
		'testFunction3',
		'testInvocation3',
		'testInvocation4',
		'sourceAnchorTestInvocation1',
		'sourceAnchorTestInvocation2',
		'sourceAnchorTestInvocation3',
		'sourceAnchorTestInvocation4',
		'sourceAnchorTestInvocation5',
		'sourceAnchorFunction1',
		'sourceAnchorFunction2',
		'sourceAnchorTestObject1',
		'testPWBOject1'
	],
	#category : #'Maryline-Tests'
}

{ #category : #public }
MRLAbstractTests >> createDirectory: aString [
	self toDelete addFirst: aString.
	^ self filesystem
		ensureCreateDirectory: (self filesystem pathFromString: aString)
]

{ #category : #running }
MRLAbstractTests >> createFile [
	self
		createFileNamed: self pwbLibString , 'fileLibA.sru'
		content: [ :stream | stream nextPutAll: self exampleFunctionSource ]
]

{ #category : #public }
MRLAbstractTests >> createFileNamed: aString content: aBlock [
	self toDelete addFirst: aString.
	aString asFileReference writeStreamDo: aBlock
]

{ #category : #'as yet unclassified' }
MRLAbstractTests >> exampleFunctionSource [
	^ 'private function integer aFunction ();
  long lLong
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
	var.isNull()
 uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")

  return LLONG
end function

private function integer f_del_ligne_suite(datawindow adw_param, long al_param, boolean ab_param)
uf_exist_col_dw(''noe_lig'',adw_dlq) and uf_exist_col_dw(''noe_cev'',adw_dlq)
end function'
]

{ #category : #public }
MRLAbstractTests >> filesystem [
	^ FileSystem disk
]

{ #category : #tests }
MRLAbstractTests >> pwbLibString [
	^ 'pwbLibs/pwbLib/'
]

{ #category : #running }
MRLAbstractTests >> setUp [
	self createDirectory: self pwbLibString.
	self createFile.
	model := FamixPWBModel new.
	model rootFolder: self pwbLibString.
	self setUpSourceAnchors.
	self setUpPWBTestObjects.
	self setUpFunction.
	self setUpInvocations
]

{ #category : #running }
MRLAbstractTests >> setUpFunction [
	testFunction1 := FamixPWBFunction new
		name: 'aFunction';
		sourceAnchor: sourceAnchorFunction1;
		parentType: testPWBOject1.
	testFunction2 := FamixPWBFunction new
		parentType: FamixPWBUserObject new;
		name: 'f_del_ligne_suite';
		sourceAnchor: sourceAnchorFunction2;
		parentType: testPWBOject1.
	testFunction3 := FamixPWBFunction new
		parentType: FamixPWBUserObject new;
		name: 'uf_exist_col_dw';
		parentType: testPWBOject1
]

{ #category : #running }
MRLAbstractTests >> setUpInvocations [
	testInvocation1 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestInvocation1;
		sender: testFunction1;
		candidates: {testFunction2}.
	testInvocation2 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestInvocation2;
		sender: testFunction1;
		candidates: {testFunction2}.
	testInvocation3 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestInvocation3;
		sender: testFunction1;
		candidates: {testFunction3}.
	testInvocation4 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestInvocation4;
		sender: testFunction1;
		candidates: {testFunction3}.
	testInvocation4 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestInvocation5;
		sender: testFunction2;
		candidates: {testFunction3}
]

{ #category : #running }
MRLAbstractTests >> setUpPWBTestObjects [
	testPWBOject1 := FamixPWBUserObject new
		mooseModel: model;
		name: 'testPWBOject1';
		sourceAnchor: sourceAnchorTestObject1.
]

{ #category : #running }
MRLAbstractTests >> setUpSourceAnchors [
	sourceAnchorFunction1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 1;
		endPos: 289;
		mooseModel: model.
	sourceAnchorTestInvocation1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 53;
		endPos: 111;
		mooseModel: model.
	sourceAnchorTestInvocation2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 167;
		endPos: 200;
		mooseModel: model.
	sourceAnchorTestInvocation3 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 128;
		endPos: 161;
		mooseModel: model.
	sourceAnchorTestInvocation4 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 167;
		endPos: 200;
		mooseModel: model.
	sourceAnchorFunction2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 292;
		endPos: 475;
		mooseModel: model.
	sourceAnchorTestInvocation5 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 429;
		endPos: 462;
		mooseModel: model.
	sourceAnchorTestObject1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 1;
		endPos: 475;
		mooseModel: model
]

{ #category : #running }
MRLAbstractTests >> tearDown [
	toDelete
		select: [ :path | self filesystem exists: path ]
		thenDo: [ :path | self filesystem delete: path ].
	super tearDown
]

{ #category : #public }
MRLAbstractTests >> toDelete [
	^ toDelete ifNil: [ toDelete := OrderedCollection new ]
]
