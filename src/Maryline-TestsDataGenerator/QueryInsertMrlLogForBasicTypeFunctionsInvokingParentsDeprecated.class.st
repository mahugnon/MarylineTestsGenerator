Class {
	#name : #QueryInsertMrlLogForBasicTypeFunctionsInvokingParentsDeprecated,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogForBasicTypeFunctionsInvokingParentsDeprecated >> runOn: aMooseModel [
	aMooseModel brPath.
	^ QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource
		runOn:
			(QueryMrlFunctionsWithBasicParametersInvokingParents
				runOn: aMooseModel)
]
