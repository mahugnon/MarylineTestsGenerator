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

{ #category : #printing }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> printPWBDeclarationScript [
	self createAssertionsFromData.
	^ String
		streamContents: [ :stream | 
			self beginOn: stream.
			self printPWBObjectCreationOn: stream.
			self printReturnValueDeclarationOn: stream.
			assertions
				do: [ :assert | stream << assert printPWBDeclarationScript ].
			self endOn: stream ]
]

{ #category : #printing }
MrlPWBUnitTestForFunctionWithBasicTypeArguments >> printPWBDeclarationScriptOn: stream [
	self createAssertionsFromData.
	self beginOn: stream.
	self printPWBObjectCreationOn: stream.
	self printReturnValueDeclarationOn: stream.
	assertions
		do: [ :assert | 
			self printInstanceVariableAccessAt: assert timestamp on: stream.
			assert printPWBDeclarationScriptOn: stream ].
	self endOn: stream.
	^ stream
]
