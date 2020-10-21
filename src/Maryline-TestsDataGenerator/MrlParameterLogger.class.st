Class {
	#name : #MrlParameterLogger,
	#superclass : #MrlAbstractLogger,
	#category : #'Maryline-TestsDataGenerator-Models'
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

{ #category : #'as yet unclassified' }
MrlParameterLogger >> startOn: stream [
	stream << 'f_mrl_logger().invocation_parameter_logger().log("'
]
