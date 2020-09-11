Class {
	#name : #MrlPWBFunctionWithBasicTypesParametersUnitAssertion,
	#superclass : #MrlPWBAbstractParametersUnitAssertion,
	#category : #'Maryline-TestsGenerator-assertions'
}

{ #category : #printing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> assertNilOn: stream [
	stream
		<< 'this.assert(';
		space;
		<< 'IsNil(';
		space;
		<< 'l_result';
		space;
		nextPut: $);
		nextPut: $);
		crlf
]

{ #category : #printing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> printFunctionInvocationScriptOn: stream [
	| param localVar |
	localVar := 'l_' , behaviorParent.
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
		crlf
]

{ #category : #printing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> printPWBDeclarationScriptOn: stream [
	self printFunctionInvocationScriptOn: stream.
	self printReturnAssertionOn: stream.
	^ stream
]

{ #category : #printing }
MrlPWBFunctionWithBasicTypesParametersUnitAssertion >> printReturnAssertionOn: stream [
	behaviorReturnValue mrlValue ifNil: [ self assertNilOn: stream ].
	stream
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
		crlf
]
