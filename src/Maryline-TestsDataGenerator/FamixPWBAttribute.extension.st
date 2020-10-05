Extension { #name : #FamixPWBAttribute }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBAttribute >> logOn: stream context: aString behavior: aFamixPWBBehavior [
	stream
		<< 'f_mrl_logger().invocation_access_logger().log(';
		<< self name;
		<< ',"';
		<< self name;
		<< '","';
		<< self parentType name;
		<< '","';
		<< aString;
		<< '"';
		<< ',"';
		<< aFamixPWBBehavior name;
		<< '","';
		<< aFamixPWBBehavior parentType name;
		<< '")';
		crlf.
	^ stream
]
