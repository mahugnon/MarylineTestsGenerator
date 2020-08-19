Class {
	#name : #QueryInsertMrlCodeLines,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlCodeLines >> runOn: sourceText with: aSubstring [
	| lines |
	lines := sourceText lines
		select: [ :aLine | 
			(aLine matchesRegex: '//.*') not
				and: [ aLine includesSubstring: aSubstring caseSensitive: false ] ].
	^ lines asSet
]
