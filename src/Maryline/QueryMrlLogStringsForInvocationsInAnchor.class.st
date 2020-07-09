Class {
	#name : #QueryMrlLogStringsForInvocationsInAnchor,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-Queries'
}

{ #category : #running }
QueryMrlLogStringsForInvocationsInAnchor >> runOn: aCollection [
	| sourceText |
	sourceText := (aCollection anyOne sender sourceAnchor rootFolder
		asFileReference
		resolve: aCollection anyOne sender sourceAnchor fileName) contents.
	aCollection
		do: [ :invocation | 
			sourceText := QueryMrlLogStringsForArgumentsWithAnchorText new
				runOn: (QueryInvocationArguments runOn: invocation)
				with: sourceText ].
	^ sourceText
]

{ #category : #running }
QueryMrlLogStringsForInvocationsInAnchor >> runOn: aCollection with: aString [
	| sourceText |
	sourceText := aString copy.
	aCollection
		do: [ :invocation | 
			sourceText := QueryMrlLogStringsForArgumentsWithAnchorText new
				runOn: (QueryInvocationArguments runOn: invocation)
				with: sourceText ].
	^ sourceText
]
