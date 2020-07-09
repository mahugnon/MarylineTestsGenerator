Class {
	#name : #QueryMrlLogStringsForFunctionInAnchor,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-Queries'
}

{ #category : #running }
QueryMrlLogStringsForFunctionInAnchor >> runOn: aFamixPWBBehaviour [
	| sourceText invocations |
	sourceText := (aFamixPWBBehaviour sourceAnchor rootFolder
		asFileReference resolve: aFamixPWBBehaviour sourceAnchor fileName)
		contents.
	invocations := (((aFamixPWBBehaviour outgoingInvocations
		select: [ :inv | 
			inv candidates
				anySatisfy: [ :candidate | candidate parentType isNotNil ] ])
		sortAscending: [ :each | each sourceAnchor startPos ])
		groupedBy: #sourceText) values collect: [ :e | e first ].
	^ QueryMrlLogStringsForInvocationsInAnchor new
		runOn: invocations
		with: sourceText
]
