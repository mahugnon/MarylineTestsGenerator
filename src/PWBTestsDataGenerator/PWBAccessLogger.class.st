Class {
	#name : #PWBAccessLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Logger'
}

{ #category : #'as yet unclassified' }
PWBAccessLogger class >> canlog: anObject [
	^ anObject isKindOf: FamixPWBAccess
]

{ #category : #'as yet unclassified' }
PWBAccessLogger class >> canlog: anObject withTag: aTag [
	^ anObject isKindOf: FamixPWBAccess
]

{ #category : #accessing }
PWBAccessLogger >> belongsTo [
	^ focus accessor
]

{ #category : #testing }
PWBAccessLogger >> isAccessLogger [
	^ true
]

{ #category : #'as yet unclassified' }
PWBAccessLogger >> logOn: stream [
	self startOn: stream.
	stream
		<< focus sourceText;
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
PWBAccessLogger >> sortingKey [
^15
]

{ #category : #'as yet unclassified' }
PWBAccessLogger >> startOn: stream [
	stream << 'f_mrl_logger().access_logger().log('
]
