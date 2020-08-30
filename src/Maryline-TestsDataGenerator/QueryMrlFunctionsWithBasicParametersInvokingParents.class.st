Class {
	#name : #QueryMrlFunctionsWithBasicParametersInvokingParents,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryMrlFunctionsWithBasicParametersInvokingParents >> runOn: aMooseModel [
	^ ((QueryMrlFunctionWithBasicTypeParameters runOn: aMooseModel)
		flatCollectAsSet: #invokingMethods) collectAsSet: #parentType
]
