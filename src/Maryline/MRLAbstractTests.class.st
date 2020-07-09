Class {
	#name : #MRLAbstractTests,
	#superclass : #TestCase,
	#instVars : [
		'toDelete',
		'model',
		'testFunction1',
		'testInvocation1',
		'testInvocation2',
		'testFunction2'
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
	^ 'global variables
long gl_long1;
global String  gs_string1;
end variables
	
	shared variables
long sl_long1;
end variables
type variables
long il_long1;
end variables
	
private function integer aFunction ();
  long lLong
f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")
	var.isNull()
  anotherFunction(2, "blah")
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
	self createFile.
	self setUpFunction.
	self setUpInvocations
]

{ #category : #running }
MRLAbstractTests >> setUpFunction [
	| sourceAnchor |
	sourceAnchor := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 169;
		endPos: 411;
		mooseModel: model.
	testFunction1 := FamixPWBFunction new
		name: 'aFunction';
		sourceAnchor: sourceAnchor.
	testFunction2 := FamixPWBFunction new
		parentType: FamixPWBUserObject new;
		name: 'f_del_ligne_suite'
]

{ #category : #running }
MRLAbstractTests >> setUpInvocations [
	| sourceAnchorTestFunction1 sourceAnchorTestFunction2 |
	sourceAnchorTestFunction1 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 221;
		endPos: 279;
		mooseModel: model.
	sourceAnchorTestFunction2 := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 324;
		endPos: 382;
		mooseModel: model.
	testInvocation1 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestFunction1;
		sender: testFunction1;
		candidates: {testFunction2}.
	testInvocation2 := FamixPWBInvocation new
		sourceAnchor: sourceAnchorTestFunction2;
		sender: testFunction1;
		candidates: {testFunction2}
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
