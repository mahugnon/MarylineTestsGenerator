"
I represent a parameter log
"
Class {
	#name : #PWBParameterLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Logger'
}

{ #category : #'as yet unclassified' }
PWBParameterLogger class >> canlog: anObject withTag: aTag [
	^ anObject isParameter
		and: [ (PWBEmptyParameterLogger canlog: anObject withTag: aTag) not ]
]

{ #category : #accessing }
PWBParameterLogger >> belongsTo [
	^ focus behavioral
]

{ #category : #testing }
PWBParameterLogger >> isParameterLogger [
	^ true
]

{ #category : #logging }
PWBParameterLogger >> logOn: stream [
	self startOn: stream.
	stream
		<< focus name;
		<< '",';
		<< focus name;
		<< ',"';
		<< focus behavioral parentType name;
		<< '","';
		<< focus behavioral name;
		<< '"';
		<< ',"';
		<< tag.
	self endOn: stream.
	^ stream
]

{ #category : #sorting }
PWBParameterLogger >> sortingKey [
^10
]

{ #category : #public }
PWBParameterLogger >> startOn: stream [
	stream << 'f_mrl_logger().parameter_logger().log("'
]
