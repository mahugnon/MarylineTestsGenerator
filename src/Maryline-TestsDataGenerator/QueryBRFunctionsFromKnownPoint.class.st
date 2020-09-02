Class {
	#name : #QueryBRFunctionsFromKnownPoint,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #'as yet unclassified' }
QueryBRFunctionsFromKnownPoint >> extractVariables: aCollectionOfPWBObjects [
	| variables |
	variables := aCollectionOfPWBObjects
		flatCollectAsSet:
			[ :each | each attributes select: [ :e | e accessingMethods isNotEmpty ] ].
	^ variables
]

{ #category : #'as yet unclassified' }
QueryBRFunctionsFromKnownPoint >> runOn: aCollectionOfPWBmajorObjects [
	^ (self
		selectIncomingInvocationMethodsUntilConvergence: (self extractVariables: aCollectionOfPWBmajorObjects))
		groupedBy: #parentType
]

{ #category : #'as yet unclassified' }
QueryBRFunctionsFromKnownPoint >> selectIncomingInvocationMethodsUntilConvergence: aCollection [
	| methods stop |
	methods := (aCollection flatCollectAsSet: [ :e | e accessingMethods ])
		reject: [ :e | e isKindOf: FamixPWBmajorObject ].
	stop := 0.
	[ stop = methods size ]
		whileFalse: [ stop := methods size.
			methods := methods
				addAll: (methods flatCollectAsSet: [ :m | m invokedMethods ]) ].
	^ ((methods reject: [ :behavioral | behavioral parentType isNil ])
		do: [ :m | m parentType addBrPathMethod: m ])
		sortDescending: [ :e | e numberOfLinesOfCode + e cyclomaticComplexity ]
]
