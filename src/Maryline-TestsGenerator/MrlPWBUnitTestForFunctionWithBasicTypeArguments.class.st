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

{ #category : #accessing }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> loadArgumentsValues [
	^ (QueryInvocationArguments runOn: invocation)
		do: [ :arg | 
			arg
				sampleValues:
					(MrlParameter
						loadWhere: [ :each | 
							each pwb_ligne_number = arg invocationLineNumber asString
								AND: [ each pwb_parameter_name = arg argumentString ] ]) ]
]
