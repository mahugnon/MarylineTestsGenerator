Class {
	#name : #MRLDatawindowInstanceGenrator,
	#superclass : #Object,
	#instVars : [
		'name',
		'originalSyntax',
		'cleanSyntax',
		'script',
		'selectSql'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> cleanSyntax [
	^ cleanSyntax
]

{ #category : #'as yet unclassified' }
MRLDatawindowInstanceGenrator >> generationCreationCreationScript [
	script := String
		streamContents: [ :stream | 
			self printCreateDatawindowScriptOn: stream.
			self tranObjectString: stream.
			self printSelectSqlOn: stream ].
	(PWBDataWindowParser new dataWindowFile parse: cleanSyntax)
		fileStatements
		select: [ :each | each isKindOf: PWBASTGraphicComponent ]
		thenDo: [ :comp | comp printModifyOn: self ].
	^ script
]

{ #category : #initialization }
MRLDatawindowInstanceGenrator >> initialize [ 
super initialize .
script := ''.
]

{ #category : #api }
MRLDatawindowInstanceGenrator >> initializeDatawindowScript [
	^ String
		streamContents: [ :stream | 
			stream
				<< 'datawindow';
				space;
				<< name;
				crlf;
				<< name;
				space;
				<< '=';
				space;
				<< 'create datawindow';
				crlf  ]
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> name [
	^ name
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> originalSyntax [
	^ originalSyntax
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> originalSyntax: aString [
	originalSyntax := aString.
	self syntaxCleaning
]

{ #category : #api }
MRLDatawindowInstanceGenrator >> printCreateDatawindowScriptOn: stream [
	^ stream
		<< 'datawindow';
		space;
		<< name;
		crlf;
		<< name;
		space;
		<< '=';
		space;
		<< 'create datawindow';
		crlf
]

{ #category : #'as yet unclassified' }
MRLDatawindowInstanceGenrator >> printSelectSqlOn: aStream [
	aStream
		<< name;
		<< '.SetSQLSelect(';
		nextPut: $";
		<<( selectSql copyReplaceAll: String crlf  with:' ') ;
		nextPut: $";
		<< ')';
		
		crlf
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> script [
	^ script
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> script: aString [ 
	script := aString
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> selectSql [
	^ selectSql
]

{ #category : #accessing }
MRLDatawindowInstanceGenrator >> selectSql: anObject [
	selectSql := anObject
]

{ #category : #api }
MRLDatawindowInstanceGenrator >> syntaxCleaning [
	cleanSyntax := originalSyntax
		replaceAllRegex: 'release.*datawindow\(.*no \)'
		with:
			'datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.prompt=no print.buttons=no print.preview.buttons=no )

header(height=72 color="536870912" )

summary(height=8 color="536870912" )

footer(height=0 color="536870912" )

detail(height=72 color="536870912" )'
]

{ #category : #'as yet unclassified' }
MRLDatawindowInstanceGenrator >> tranObjectString: aStream [
	aStream
		<< name;
		<< '.SetTransObject(SqlCa)';
		crlf
]
