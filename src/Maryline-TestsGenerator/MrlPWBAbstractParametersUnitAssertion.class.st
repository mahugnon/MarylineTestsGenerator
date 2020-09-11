Class {
	#name : #MrlPWBAbstractParametersUnitAssertion,
	#superclass : #Object,
	#instVars : [
		'mrlParameters',
		'behaviorName',
		'behaviorParent',
		'behaviorReturnValue',
		'originalBehavior'
	],
	#category : #'Maryline-TestsGenerator-assertions'
}

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> behaviorName [
	^ behaviorName
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> behaviorName: anObject [
	behaviorName := anObject
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> behaviorParent [
	^ behaviorParent
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> behaviorParent: anObject [
	behaviorParent := anObject
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> behaviorReturnValue [
	^ behaviorReturnValue
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> behaviorReturnValue: anObject [
	behaviorReturnValue := anObject
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> mrlParameters [
	^ mrlParameters sortAscending: #startPosition
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> mrlParameters: anObject [
	mrlParameters := anObject
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> originalBehavior [
	^ originalBehavior
]

{ #category : #accessing }
MrlPWBAbstractParametersUnitAssertion >> originalBehavior: anObject [
	originalBehavior := anObject
]

{ #category : #printing }
MrlPWBAbstractParametersUnitAssertion >> printPWBDeclarationScript [
	| localVar param |
	localVar := 'l_' , behaviorParent.
	^ String
		streamContents: [ :stream | 
			stream
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
