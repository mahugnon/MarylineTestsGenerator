Extension { #name : #FamixPWBParameter }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBParameter >> logOn: stream context: aString [
	stream
		<< 'f_mrl_logger().invocation_parameter_logger().log("';
		<< self name;
		<< '",';
		<< self name;
		<< ',"';
		<< self behavioral parentType name;
		<< '","';
		<< self behavioral name;
		<< '"';
		<< ',"';
		<< aString;
		<< '")';
		crlf.
	^ stream
]

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBParameter >> logOn: stream context: aString behavior: aFamixPWBBehavior [
	stream
		<< 'f_mrl_logger().invocation_parameter_logger().log("';
		<< self name;
		<< '",';
		<< self name;
		<< ',"';
		<< self behavioral parentType name;
		<< '","';
		<< self behavioral name;
		<< '"';
		<< ',"';
		<< aString;
		<< '")';
		crlf.
	^ stream
]
