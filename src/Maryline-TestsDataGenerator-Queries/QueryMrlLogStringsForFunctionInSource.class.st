Class {
	#name : #QueryMrlLogStringsForFunctionInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #initialization }
QueryMrlLogStringsForFunctionInSource >> initialize [
	super initialize.
	alterFile := false
]

{ #category : #running }
QueryMrlLogStringsForFunctionInSource >> runOn: aFamixPWBBehaviour [
	| sourceText invocations file |
	file := aFamixPWBBehaviour sourceAnchor rootFolder asFileReference
		resolve: aFamixPWBBehaviour sourceAnchor fileName.
	sourceText := aFamixPWBBehaviour sourceText.
	invocations := ((aFamixPWBBehaviour outgoingInvocations
		select: [ :inv | 
			inv candidates
				anySatisfy:
					[ :candidate | candidate parentType isNotNil and: [ candidate isSubRoutine not ] ] ])
		groupedBy: #sourceText) values collect: [ :e | e first ].
	"sortAscending: [ :each | each sourceAnchor startPos ]"
	sourceText := QueryMrlLogStringsForInvocationsInSource new
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
