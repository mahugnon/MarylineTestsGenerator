Class {
	#name : #MrlPWBFunctionWithComplexParametersUnitAssertion,
	#superclass : #MrlPWBAbstractParametersUnitAssertion,
	#category : #'Maryline-TestsDataGenerator-Model'
}

{ #category : #printing }
MrlPWBFunctionWithComplexParametersUnitAssertion >> printPWBDeclarationScript [
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
