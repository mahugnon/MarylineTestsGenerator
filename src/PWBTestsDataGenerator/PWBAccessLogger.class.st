"
I represent  an access log
"
Class {
	#name : #PWBAccessLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Logger'
}

{ #category : #'as yet unclassified' }
PWBAccessLogger class >> canlog: anObject withTag: aTag [
	^ anObject isAccess
]

{ #category : #accessing }
PWBAccessLogger >> belongsTo [
	^ focus accessor
]

{ #category : #testing }
PWBAccessLogger >> isAccessLogger [
	^ true
]

{ #category : #logging }
PWBAccessLogger >> logOn: stream [
	| varName |
	"Dataobject allways belongsTo  a datawindow attribute. The goal here is to log the datawindow instead of the dataobject. Because the data object might be the same but data have changed"
	varName := focus variable name asLowercase = 'dataobject'
		ifTrue:
			[ focus sourceText asLowercase copyReplaceAll: '.dataobject' with: '' ]
		ifFalse: [ focus sourceText ].
	self startOn: stream.
	stream
		<< varName;
		<< ',"';
		<< (varName copyReplaceAll: 'this.' with: '');
		<< '","';
		<< focus variable parentType name;
		<< '","';
		<< tag;
		<< '"';
		<< ',"';
		<< focus accessor name;
		<< '","';
		<< focus accessor parentType name.
	self endOn: stream.
	^ stream
]

{ #category : #sorting }
PWBAccessLogger >> sortingKey [
^15
]

{ #category : #logging }
PWBAccessLogger >> startOn: stream [
	stream << 'f_mrl_logger().access_logger().log('
]
