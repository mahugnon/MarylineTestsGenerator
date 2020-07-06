Class {
	#name : #QueryInvocationArguments,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-Queries'
}

{ #category : #running }
QueryInvocationArguments >> runOn: aFamixPWBInvocation [
|invocationAST|
invocationAST := PWBCommonParser new functionInvocation parse: (aFamixPWBInvocation sourceText ).
	
]
