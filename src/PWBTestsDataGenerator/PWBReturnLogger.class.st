Class {
	#name : #PWBReturnLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #accessing }
PWBReturnLogger >> belongsTo [
	^ focus behavioral
]

{ #category : #'as yet unclassified' }
PWBReturnLogger >> endOn: stream [
	stream
		<< '");';
		tab
]

{ #category : #testing }
PWBReturnLogger >> isReturnLogger [
	^ true
]

{ #category : #'as yet unclassified' }
PWBReturnLogger >> logOn: stream [
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
PWBReturnLogger >> sortingKey [ 
^30
]

{ #category : #'as yet unclassified' }
PWBReturnLogger >> startOn: stream [
	stream << 'f_mrl_logger().return_value_logger().log('
]
