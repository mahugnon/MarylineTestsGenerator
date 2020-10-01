Class {
	#name : #QueryInsertMrlLogForFunctionsInvokingParents,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogForFunctionsInvokingParents >> runOn: aMooseModel [
	aMooseModel businessRulePath.
	^ QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource
		runOn: aMooseModel businessRulePath keys
]
