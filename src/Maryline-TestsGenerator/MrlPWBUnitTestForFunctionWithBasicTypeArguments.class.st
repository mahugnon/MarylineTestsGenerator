Class {
	#name : #MrlPWBUnitTestForFunctionWithBasicTypeArguments,
	#superclass : #MrlPWBUnitTest,
	#category : #'Maryline-TestsGenerator-MrlTestUnitStrategy'
}

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithBasicTypeArguments class >> accept: aFamixPWBInvocation [
	^ aFamixPWBInvocation candidates anyOne parameters
		allSatisfy: [ :param | param isBasic ]
]

{ #category : #visiting }
MrlPWBUnitTestForFunctionWithBasicTypeArguments class >> acceptFunction: aFamixPWBFunction [
	^ aFamixPWBFunction parameters allSatisfy: [ :param | param isBasic ]
]

{ #category : #accessing }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> loadArgumentsValues [
	| arguments |
	arguments := QueryInvocationArguments runOn: invocation.
	^ invocation candidates anyOne parameters
		do: [ :arg | 
			arg
				sampleValues:
					(MrlParameter
						loadWhere: [ :each | 
							each pwb_ligne_number = arguments anyOne invocationLineNumber asString
								AND: [ each pwb_parameter_name = arg argumentString ] ]) ]
]
