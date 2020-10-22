Class {
	#name : #MrlDatawindowInstanceGenrationTests,
	#superclass : #TestCase,
	#instVars : [
		'mRLDatawindowInstanceGenrator'
	],
	#category : #'Maryline-TestsDataGenerator-Tests'
}

{ #category : #running }
MrlDatawindowInstanceGenrationTests >> setUp [
	mRLDatawindowInstanceGenrator := MRLDatawindowInstanceGenrator new
		name: 'dw_dlq'
]

{ #category : #tests }
MrlDatawindowInstanceGenrationTests >> tearDown [ 

]

{ #category : #tests }
MrlDatawindowInstanceGenrationTests >> testCleanSyntax [
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
MrlDatawindowInstanceGenrationTests >> testCreateDatawindowdlq [
	self
		assert: mRLDatawindowInstanceGenrator initializeDatawindowScript
		equals:
			'datawindow dw_dlq
dw_dlq = create datawindow
'
]
