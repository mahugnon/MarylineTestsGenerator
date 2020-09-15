Class {
	#name : #QueryInsertMrlLogStringsForFunctionsInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogStringsForFunctionsInSource >> runOn: aCollection [
	^ (((aCollection groupedBy: #mooseName) values collect: #anyOne)
		collect:
			[ :function | function -> (QueryMrlLogStringsForFunctionInSource runOn: function) ])
		asOrderedDictionary
]
