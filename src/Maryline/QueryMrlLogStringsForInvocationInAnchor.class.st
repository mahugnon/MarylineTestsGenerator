Class {
	#name : #QueryMrlLogStringsForInvocationInAnchor,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-Queries'
}

{ #category : #running }
QueryMrlLogStringsForInvocationInAnchor >> runOn: aFamixPWBInvocation with: aString [
	^ QueryMrlLogStringsForArgumentsWithAnchorText new
		runOn: (QueryInvocationArguments runOn: aFamixPWBInvocation)
		with: aString
]
