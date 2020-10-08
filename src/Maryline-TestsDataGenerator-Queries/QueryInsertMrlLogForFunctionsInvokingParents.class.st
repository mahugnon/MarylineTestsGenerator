Class {
	#name : #QueryInsertMrlLogForFunctionsInvokingParents,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogForFunctionsInvokingParents >> runOn: aMooseModel [
	aMooseModel getBusinessRuleFunctions.
	^ QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource
		runOn: aMooseModel getBusinessRuleFunctions keys
]
