Class {
	#name : #MRLAbstractTests,
	#superclass : #TestCase,
	#instVars : [
		'testInvocation',
		'toDelete',
		'model',
		'testFunction1'
	],
	#category : #'Maryline-Tests'
}

{ #category : #public }
MRLAbstractTests >> createDirectory: aString [
	self toDelete addFirst: aString.
	^ self filesystem
		ensureCreateDirectory: (self filesystem pathFromString: aString)
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
	| sourceAnchor |
	self createDirectory: self pwbLibString.
	model := FamixPWBModel new.
	model rootFolder: self pwbLibString.
	self
		createFileNamed: self pwbLibString , 'fileLibA.sru'
		content: [ :stream | stream nextPutAll: self exampleFunctionSource ].
	sourceAnchor := FamixPWBIndexedFileAnchor new
		fileName: 'fileLibA.sru';
		startPos: 169;
		endPos: 411;
		mooseModel: model.
	testFunction1 := FamixPWBFunction new
		name: 'aFunction';
		sourceAnchor: sourceAnchor.
	testInvocation := MRLTestMockInvocation new
		sender: testFunction1;
		candidates:
			{(FamixPWBFunction new
				parentType: FamixPWBUserObject new;
				name: 'f_del_ligne_suite')}.
	testInvocation
		sourceText: 'f_del_ligne_suite(adw_dlq, al_lig, is_col_dec <> "dlq_rel")'
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
