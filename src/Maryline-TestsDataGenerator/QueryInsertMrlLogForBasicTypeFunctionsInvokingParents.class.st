Class {
	#name : #QueryInsertMrlLogForBasicTypeFunctionsInvokingParents,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogForBasicTypeFunctionsInvokingParents >> runOn: aMooseModel [
	aMooseModel brPath.
	^ QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource
		runOn: aMooseModel brPath keys
]
