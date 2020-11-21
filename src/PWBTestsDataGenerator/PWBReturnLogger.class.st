Class {
	#name : #PWBReturnLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Logger'
}

{ #category : #accessing }
PWBReturnLogger >> belongsTo [
	^ focus behavioral
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
^20
]

{ #category : #'as yet unclassified' }
PWBReturnLogger >> startOn: stream [
	stream << 'f_mrl_logger().return_value_logger().log('
]
