Class {
	#name : #QueryInsertMrlLogForFunctionsInvokingParents,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogForFunctionsInvokingParents >> runOn: aMooseModel [
	self halt.
	aMooseModel brPath.
	^ QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource
		runOn: aMooseModel brPath keys
]
