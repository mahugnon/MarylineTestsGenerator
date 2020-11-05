Extension { #name : #FamixPWBAccess }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBAccess >> isRelatedTo: aString [
	^ self accessor name = aString
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBAccess >> logOn: stream context: aString [
	stream
		<< 'f_mrl_logger().access_logger().log(';
		<< self variable name;
		<< ',"';
		<< self variable name;
		<< '","';
		<< self variable parentType name;
		<< '","';
		<< aString;
		<< '"';
		<< ',"';
		<< self accessor name;
		<< '","';
		<< self accessor parentType name;
		<< '")';
		crlf.
	^ stream
]
