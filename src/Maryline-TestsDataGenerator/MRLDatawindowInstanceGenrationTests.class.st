Class {
	#name : #MRLDatawindowInstanceGenrationTests,
	#superclass : #MRLAbstractTests,
	#instVars : [
		'mRLDatawindowInstanceGenrator'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #'as yet unclassified' }
MRLDatawindowInstanceGenrationTests >> exampleSQLSelect [
	^ ((IceBergProjectLocator
		locationOfProjectRepo: 'MarylineTestsGenerator')
		/ 'Resources/sqlSelect.txt') contents
]

{ #category : #'as yet unclassified' }
MRLDatawindowInstanceGenrationTests >> exampleSyntax [
	^ ((IceBergProjectLocator
		locationOfProjectRepo: 'MarylineTestsGenerator')
		/ 'Resources/syntax.txt') contents
]

{ #category : #running }
MRLDatawindowInstanceGenrationTests >> setUp [
	mRLDatawindowInstanceGenrator := MRLDatawindowInstanceGenrator new
		name: 'dw_dlq'
]

{ #category : #tests }
MRLDatawindowInstanceGenrationTests >> tearDown [ 

]

{ #category : #tests }
MRLDatawindowInstanceGenrationTests >> testCleanSyntax [
	mRLDatawindowInstanceGenrator
		originalSyntax:
			'release 17;
datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.prompt=no print.buttons=no print.preview.buttons=no )

header(height=72 color="536870912" )

summary(height=8 color="536870912" )

footer(height=0 color="536870912" )

detail(height=72 color="536870912" )'.
	self
		assert: mRLDatawindowInstanceGenrator cleanSyntax
		equals:
			'datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.prompt=no print.buttons=no print.preview.buttons=no )

header(height=72 color="536870912" )

summary(height=8 color="536870912" )

footer(height=0 color="536870912" )

detail(height=72 color="536870912" )

header(height=72 color="536870912" )

summary(height=8 color="536870912" )

footer(height=0 color="536870912" )

detail(height=72 color="536870912" )'
]

{ #category : #tests }
MRLDatawindowInstanceGenrationTests >> testCreateDatawindowdlq [
	self
		assert: mRLDatawindowInstanceGenrator initializeDatawindowScript
		equals:
			'datawindow dw_dlq
dw_dlq = create datawindow
'
]
