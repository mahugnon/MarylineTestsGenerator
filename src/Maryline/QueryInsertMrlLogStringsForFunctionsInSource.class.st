Class {
	#name : #QueryInsertMrlLogStringsForFunctionsInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-Queries'
}

{ #category : #running }
QueryInsertMrlLogStringsForFunctionsInSource >> runOn: aCollection [
	^ (aCollection
		collect:
			[ :function | function -> (QueryMrlLogStringsForFunctionInAnchor runOn: function) ])
		asOrderedDictionary
]
