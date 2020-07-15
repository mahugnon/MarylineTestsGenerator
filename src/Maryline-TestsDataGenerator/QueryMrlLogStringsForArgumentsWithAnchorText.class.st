Class {
	#name : #QueryMrlLogStringsForArgumentsWithAnchorText,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryMrlLogStringsForArgumentsWithAnchorText >> runOn: aCollection with: aString [
	| sourceText |
	sourceText := aString copy.
	aCollection
		do:
			[ :mrlAgument | sourceText := mrlAgument generateInSourceTextMrlLogStrings: sourceText ].
	^ sourceText
]
