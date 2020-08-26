Class {
	#name : #QueryInsertMrlLogStringsForBRFunctionsInPWBObjectInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogStringsForBRFunctionsInPWBObjectInSource >> runOn: aPWBObject [
	| mrlBehaviorStringDic file tempFileContents |
	mrlBehaviorStringDic := QueryInsertMrlLogStringsForFunctionsInSource
		runOn:
			(aPWBObject brPath
				ifNil: [ QueryBRFunctionsFromKnownPoint runOn: {aPWBObject} ]).
	aPWBObject brPath
		sortAscending: [ :aBehavior | aBehavior sourceAnchor startPos ].
	file := aPWBObject sourceAnchor rootFolder asFileReference
		resolve: aPWBObject sourceAnchor fileName.
	tempFileContents := aPWBObject sourceText.
	mrlBehaviorStringDic
		keysAndValuesDo: [ :key :value | 
			tempFileContents := tempFileContents
				copyReplaceAll: key sourceText
				with: value ].
	aPWBObject sourceAnchor endPos: tempFileContents size.
	file writeStreamDo: [ :stream | stream << tempFileContents ].
	^ aPWBObject
]
