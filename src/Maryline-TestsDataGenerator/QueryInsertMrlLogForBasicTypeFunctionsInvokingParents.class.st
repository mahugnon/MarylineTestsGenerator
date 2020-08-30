Class {
	#name : #QueryInsertMrlLogForBasicTypeFunctionsInvokingParents,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogForBasicTypeFunctionsInvokingParents >> runOn: aMooseModel [
	^ QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource
		runOn:
			(QueryMrlFunctionsWithBasicParametersInvokingParents
				runOn: aMooseModel)
]
