Class {
	#name : #MrlReturnLogger,
	#superclass : #MrlAbstractLogger,
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #accessing }
MrlReturnLogger >> belongsTo [
	^ focus behavioral
]

{ #category : #'as yet unclassified' }
MrlReturnLogger >> endOn: stream [
	stream
		<< '");';
		tab
]

{ #category : #testing }
MrlReturnLogger >> isReturnLogger [
	^ true
]

{ #category : #'as yet unclassified' }
MrlReturnLogger >> logOn: stream [
	self startOn: stream.
	stream
		<< focus returnValue asString;
		<< ',"';
		<< focus behavioral name;
		<< '","';
		<< focus behavioral parentType name.
	self endOn: stream.
	^ stream
]

{ #category : #'as yet unclassified' }
MrlReturnLogger >> sortingKey [ 
^30
]

{ #category : #'as yet unclassified' }
MrlReturnLogger >> startOn: stream [
	stream << 'f_mrl_logger().return_value_logger().log('
]
