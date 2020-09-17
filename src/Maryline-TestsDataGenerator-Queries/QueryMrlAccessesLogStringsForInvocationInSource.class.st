Class {
	#name : #QueryMrlAccessesLogStringsForInvocationInSource,
	#superclass : #MRLAbstractQuery,
	#instVars : [
		'behavior',
		'invocationLine'
	],
	#classVars : [
		'identity'
	],
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryMrlAccessesLogStringsForInvocationInSource >> printMrlAccessLogFor: aFamixPWBVariable On: stream context: aContextName [
	^ stream
		<< 'f_mrl_logger().access_logger().log(';
		<< aFamixPWBVariable name;
		space;
		nextPut: $,;
		space;
		nextPut: $";
		<< aFamixPWBVariable name;
		nextPut: $";
		nextPut: $,;
		space;
		nextPut: $";
		<< aFamixPWBVariable parentType name;
		nextPut: $";
		space;
		nextPut: $,;
		space;
		nextPut: $";
		<< aContextName;
		nextPut: $";
		space;
		nextPut: $,;
		space;
		nextPut: $";
		<< behavior name;
		nextPut: $";
		space;
		nextPut: $,;
		space;
		nextPut: $";
		<< behavior parentType name;
		nextPut: $";
		space;
		nextPut: $,;
		space;
		nextPut: $";
		<< invocationLine;
		nextPut: $";
		nextPut: $);
		crlf
]

{ #category : #running }
QueryMrlAccessesLogStringsForInvocationInSource >> printMrlAfterAccessLogFor: aFamixPWBVariable On: stream [
	^ self printMrlAccessLogFor: aFamixPWBVariable On: stream context: 'after'
]

{ #category : #running }
QueryMrlAccessesLogStringsForInvocationInSource >> printMrlBeforeAccessLogFor: aFamixPWBVariable On: stream [
	^ self printMrlAccessLogFor: aFamixPWBVariable On: stream context: 'before'
]

{ #category : #running }
QueryMrlAccessesLogStringsForInvocationInSource >> runOn: aFamixPWBInvocation with: aString [
	| accesses |
	behavior := aFamixPWBInvocation candidates anyOne.
	invocationLine := aFamixPWBInvocation sourceAnchor startLine asString.
	accesses := (behavior accesses collectAsSet: #variable)
		select: [ :each | 
			each isInstanceVariable
				and: [ {'true' . 'false'}
						allSatisfy: [ :bool | bool ~= each name asLowercase ] ] ].
	accesses
		ifEmpty: [ ^ aString ]
		ifNotEmpty: [ ^ String
				streamContents: [ :stream | 
					accesses
						do: [ :each | self printMrlBeforeAccessLogFor: each On: stream ].
					stream << aString.
					accesses
						do: [ :each | self printMrlAfterAccessLogFor: each On: stream ] ] ]
]
