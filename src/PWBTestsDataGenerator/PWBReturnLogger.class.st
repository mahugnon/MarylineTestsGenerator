"
I represent a return value log
"
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

{ #category : #logging }
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

{ #category : #sorting }
PWBReturnLogger >> sortingKey [ 
^20
]

{ #category : #logging }
PWBReturnLogger >> startOn: stream [
	stream << 'f_mrl_logger().return_value_logger().log('
]
