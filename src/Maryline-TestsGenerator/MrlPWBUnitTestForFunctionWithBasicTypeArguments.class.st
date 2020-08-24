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
	^ aFamixPWBFunction parameters isNotEmpty
		and: [ aFamixPWBFunction parameters allSatisfy: #isBasic ]
]

{ #category : #'as yet unclassified' }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> loadTestData [
	^ MrlBehavior
		loadWithMrlParameterAndMrlReturnValuesWhere: [ :function | 
			function behavior_name = functionUnderTest name
				AND: [ function pwb_object = functionUnderTest parentType name ] ]
]
