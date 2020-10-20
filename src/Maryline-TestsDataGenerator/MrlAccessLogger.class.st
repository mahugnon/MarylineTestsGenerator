Class {
	#name : #MrlAccessLogger,
	#superclass : #MrlAbstractLogger,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlAccessLogger class >> canlog: anObject [
	^ anObject isKindOf: FamixPWBAccess
]

{ #category : #testing }
MrlAccessLogger >> isAccessLogger [
	^ true
]

{ #category : #'as yet unclassified' }
MrlAccessLogger >> logOn: stream [
	self startOn: stream.
	stream
		<< focus variable name;
		<< ',"';
		<< focus variable name;
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

{ #category : #'as yet unclassified' }
MrlAccessLogger >> startOn: stream [
	stream << 'f_mrl_logger().access_logger().log('
]
