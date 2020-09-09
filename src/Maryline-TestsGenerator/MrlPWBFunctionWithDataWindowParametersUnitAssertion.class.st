Class {
	#name : #MrlPWBFunctionWithDataWindowParametersUnitAssertion,
	#superclass : #MrlPWBAbstractParametersUnitAssertion,
	#category : #'Maryline-TestsGenerator-assertions'
}

{ #category : #printing }
MrlPWBFunctionWithDataWindowParametersUnitAssertion >> printFunctionInvocationScriptOn: stream [
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
		param isPWBDataWindow
			ifTrue: [ stream
					<< 'lw_maryline_test_window.dw_input';
					space;
					nextPut: $, ]
			ifFalse: [ stream
					<<
						(BasicTypeValueResolver
							resolveValue: param parameter_before_value
							withType: param parameterType name);
					space;
					nextPut: $, ] ].
	param := self mrlParameters last.
	param isPWBDataWindow
		ifTrue: [ stream << 'lw_maryline_test_window.dw_input' ]
		ifFalse: [ stream
				<<
					(BasicTypeValueResolver
						resolveValue: param parameter_before_value
						withType: param parameterType name);
				space;
				nextPut: $) ]
]

{ #category : #printing }
MrlPWBFunctionWithDataWindowParametersUnitAssertion >> printPWBDeclarationScript [
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
				param isDatawindow
					ifTrue: [ stream
							<< 'lw_maryline_test_window.dw_input';
							space;
							nextPut: $, ]
					ifFalse: [ stream
							<<
								(BasicTypeValueResolver
									resolveValue: param parameter_before_value
									withType: param parameterType name);
							space;
							nextPut: $, ] ].
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

{ #category : #printing }
MrlPWBFunctionWithDataWindowParametersUnitAssertion >> printPWBDeclarationScriptOn: stream [
	self printWindowDwSetUpOn: stream.
	self printFunctionInvocationScriptOn: stream.
	stream
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
		crlf.
	^ stream
]

{ #category : #printing }
MrlPWBFunctionWithDataWindowParametersUnitAssertion >> printWindowDwSetUpOn: stream [
	^ (MarylineDWFieldTypeExtractor
		parameter: (self mrlParameters detect: [ :param | param isPWBDataWindow ]))
		extractOn: stream
]
