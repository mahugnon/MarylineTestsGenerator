Class {
	#name : #QueryMrlReturnValueLogStringsForInvocationInSource,
	#superclass : #MRLAbstractQuery,
	#classVars : [
		'identity'
	],
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #'instance creation' }
QueryMrlReturnValueLogStringsForInvocationInSource class >> identity [
identity ifNil: [ identity := 0 ].
identity := identity +1.
^identity

]

{ #category : #initialization }
QueryMrlReturnValueLogStringsForInvocationInSource class >> resetIdentity [
	identity := nil
]

{ #category : #'instance creation' }
QueryMrlReturnValueLogStringsForInvocationInSource >> identity [
	^ self class identity asString
]

{ #category : #running }
QueryMrlReturnValueLogStringsForInvocationInSource >> runOn: aFamixPWBInvocation with: aString [
	| returnType behavior returnVar invocationLine |
	behavior := aFamixPWBInvocation candidates anyOne.
	returnType := behavior returnType.
	invocationLine := aFamixPWBInvocation sourceAnchor startLine asString.
	returnType ifNil: [ ^ '' ].
	returnType isString
		ifFalse: [ returnType := returnType name ].
	returnVar := 'lvar' , invocationLine , self identity , '_'
		, behavior name , '_return'.
	^ String
		streamContents: [ :stream | 
			stream
				<< returnType;
				space;
				<< returnVar;
				crlf;
				<< returnVar;
				space;
				<< '=';
				space;
				<< aString;
				crlf;
				<< 'f_mrl_logger().return_value_logger().log(';
				space;
				<< returnVar;
				nextPut: $,;
				space;
				<< invocationLine;
				space;
				nextPut: $,;
				<< '"';
				<< behavior name;
				<< '"';
				space;
				nextPut: $,;
				<< '"';
				<< behavior parentType name;
				<< '"';
				space;
				nextPut: $);
				crlf ]
]
