Class {
	#name : #MrlParameterLogger,
	#superclass : #MrlAbstractLogger,
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlParameterLogger class >> canlog: anObject [
	^ anObject isKindOf: FamixPWBParameter
]

{ #category : #'as yet unclassified' }
MrlParameterLogger class >> canlog: anObject withTag: aTag [
	^ (anObject isKindOf: FamixPWBParameter)
		and: [ (MrlEmptyParameterLogger canlog: anObject withTag: aTag) not ]
]

{ #category : #accessing }
MrlParameterLogger >> belongsTo [
	^ focus behavioral
]

{ #category : #testing }
MrlParameterLogger >> isParameterLogger [
	^ true
]

{ #category : #'as yet unclassified' }
MrlParameterLogger >> logOn: stream [
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

{ #category : #public }
MrlParameterLogger >> startOn: stream [
	stream << 'f_mrl_logger().parameter_logger().log("'
]
