Class {
	#name : #MrlPWBFunctionWithBasicTypesParametersUnitAssertion,
	#superclass : #Object,
	#instVars : [
		'mrlParameters',
		'behaviorName',
		'behaviorParent',
		'behaviorReturnValue',
		'originalBehavior'
	],
	#category : #'Maryline-TestsDataGenerator-Model'
}

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> behaviorName [
	^ behaviorName
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> behaviorName: anObject [
	behaviorName := anObject
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> behaviorParent [
	^ behaviorParent
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> behaviorParent: anObject [
	behaviorParent := anObject
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> behaviorReturnValue [
	^ behaviorReturnValue
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> behaviorReturnValue: anObject [
	behaviorReturnValue := anObject
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> mrlParameters [
	^ mrlParameters sortAscending: #startPosition
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> mrlParameters: anObject [
	mrlParameters := anObject
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> originalBehavior [
	^ originalBehavior
]

{ #category : #accessing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> originalBehavior: anObject [
	originalBehavior := anObject
]

{ #category : #printing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> printPWBDeclarationScript [
	| localVar param |
	localVar := 'l_' , behaviorParent.
	^ String
		streamContents: [ :stream | 
			stream
				<< behaviorParent;
				space;
				<< localVar;
				crlf;
				<< localVar;
				space;
				<< '=';
				space;
				<< 'create';
				space;
				<< behaviorParent;
				crlf;
				<< originalBehavior returnType name;
				space;
				<< 'l_result';
				crlf;
				<< 'l_result = ';
				<< localVar;
				nextPut: $.;
				<< behaviorName;
				nextPut: $(.
			1 to: self mrlParameters size - 1 do: [ :iter | 
				param := self mrlParameters at: iter.
				stream
					<<
						(BasicTypeValueResolver
							resolveValue: param parameter_before_value
							withType: param parameterType name);
					space;
					nextPut: $, ].
			param := self mrlParameters last.
			stream
				<<
					(BasicTypeValueResolver
						resolveValue: param parameter_before_value
						withType: param parameterType name);
				space;
				nextPut: $);
				crlf;
				<< 'this.assert(';
				space;
				<<
					(BasicTypeValueResolver
						resolveValue: behaviorReturnValue mrlValue
						withType: originalBehavior returnType name);
				space;
				<< '=';
				space;
				<< 'l_result';
				nextPut: $);
				crlf ]
]
