Class {
	#name : #QueryMrlLogStringsForArgumentsInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryMrlLogStringsForArgumentsInSource >> runOn: aCollection with: aString [
	| sourceText |
	sourceText := aString copy.
	aCollection
		do:
			[ :mrlAgument | sourceText := mrlAgument generateInSourceTextMrlLogStrings: sourceText ].
	^ sourceText
]
