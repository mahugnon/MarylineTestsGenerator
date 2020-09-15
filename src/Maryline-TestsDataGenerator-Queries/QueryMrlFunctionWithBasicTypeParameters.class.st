Class {
	#name : #QueryMrlFunctionWithBasicTypeParameters,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryMrlFunctionWithBasicTypeParameters >> modelFunctions: aMooseModel [
	^ aMooseModel allWithType: FamixPWBFunction
]

{ #category : #running }
QueryMrlFunctionWithBasicTypeParameters >> modelFunctionsWithoutStub: aMooseModel [
	^ (self modelFunctions: aMooseModel)
		select: [ :uf | uf parentType isNotNil ]
]

{ #category : #running }
QueryMrlFunctionWithBasicTypeParameters >> runOn: aMooseModel [
	^ ((self modelFunctionsWithoutStub: aMooseModel)
		do: [ :uf | uf setParameters ])
		select: [ :uf | 
			uf parameters isNotEmpty
				and: [ uf parameters allSatisfy: [ :param | param isBasic ] ] ]
]
