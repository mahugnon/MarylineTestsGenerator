Class {
	#name : #MrlParameterLogger,
	#superclass : #MrlAbstractLogger,
	#category : #'Maryline-TestsDataGenerator-Models'
}

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
