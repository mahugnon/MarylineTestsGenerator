Class {
	#name : #QueryInsertMrlLogStringsForFunctionsInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogStringsForFunctionsInSource >> runOn: aCollection [
	^ (aCollection
		collect:
			[ :function | function -> (QueryMrlLogStringsForFunctionInAnchor runOn: function) ])
		asOrderedDictionary
]
