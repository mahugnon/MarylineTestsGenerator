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
		'sourceAnchorTestFunction3',
		'sourceAnchorTestFunction4',
		'sourceAnchorTestFunction1',
		'sourceAnchorTestFunction2',
		'testFunction3',
		'sourceAnchor',
		'testInvocation3',
		'testInvocation4'
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
	model := FamixPWBModel new.
	model rootFolder: self pwbLibString.
		self setUpSourceAnchors.
	self createFile.
	self setUpFunction.
	self setUpInvocations
]

{ #category : #running }
MRLAbstractTests >> setUpFunction [
	testFunction1 := FamixPWBFunction new
		name: 'aFunction';
		sourceAnchor: sourceAnchor.
	testFunction2 := FamixPWBFunction new
		parentType: FamixPWBUserObject new;
		name: 'f_del_ligne_suite'.
	testFunction3 := FamixPWBFunction new
		parentType: FamixPWBUserObject new;
		name: 'uf_exist_col_dw'
]

{ #category : #running }
MRLAbstractTests >> setUpInvocations [
	testInvocation1 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestFunction1;
		sender: testFunction1;
		candidates: {testFunction2}.
	testInvocation2 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestFunction2;
		sender: testFunction1;
		candidates: {testFunction2}.
	testInvocation3 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestFunction3;
		sender: testFunction1;
		candidates: {testFunction3}.
	testInvocation4 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestFunction4;
		sender: testFunction1;
		candidates: {testFunction3}
]

{ #category : #running }
MRLAbstractTests >> setUpSourceAnchors [
	sourceAnchor := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 1;
		endPos: 289;
		mooseModel: model.
	sourceAnchorTestFunction1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 53;
		endPos: 111;
		mooseModel: model.
	sourceAnchorTestFunction2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 167;
		endPos: 200;
		mooseModel: model.
	sourceAnchorTestFunction3 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 128;
		endPos: 161;
		mooseModel: model.
	sourceAnchorTestFunction4 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 167;
		endPos: 200;
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
