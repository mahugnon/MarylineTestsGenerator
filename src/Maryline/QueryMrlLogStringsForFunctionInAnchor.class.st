Class {
	#name : #QueryMrlLogStringsForFunctionInAnchor,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-Queries'
}

{ #category : #initialization }
QueryMrlLogStringsForFunctionInAnchor >> initialize [
	super initialize.
	alterFile := false
]

{ #category : #running }
QueryMrlLogStringsForFunctionInAnchor >> runOn: aFamixPWBBehaviour [
	| sourceText invocations file |
	file := aFamixPWBBehaviour sourceAnchor rootFolder asFileReference
		resolve: aFamixPWBBehaviour sourceAnchor fileName.
	sourceText := aFamixPWBBehaviour sourceText.
	invocations := (((aFamixPWBBehaviour outgoingInvocations
		select: [ :inv | 
			inv candidates
				anySatisfy: [ :candidate | candidate parentType isNotNil ] ])
		sortAscending: [ :each | each sourceAnchor startPos ])
		groupedBy: #sourceText) values collect: [ :e | e first ].
	sourceText := QueryMrlLogStringsForInvocationsInAnchor new
		runOn: invocations
		with: sourceText.
	alterFile
		ifTrue: [ file
				writeStreamDo: [ :aStream | 
					aStream
						<<
							(file contents
								copyReplaceAll: aFamixPWBBehaviour sourceText
								with: sourceText) ] ]
		ifFalse: [ ^ sourceText ]
]
