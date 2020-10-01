Class {
	#name : #QueryInsertMrlLogStringsForFunctionsInPWBObjectInSource,
	#superclass : #MRLAbstractQuery,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #initialization }
QueryInsertMrlLogStringsForFunctionsInPWBObjectInSource >> initialize [
	alterFile := false
]

{ #category : #running }
QueryInsertMrlLogStringsForFunctionsInPWBObjectInSource >> runOn: aPWBObject [
	| mrlBehaviorStringDic |
	mrlBehaviorStringDic := QueryInsertMrlLogStringsForFunctionsInSource
		runOn:
			(aPWBObject businessRulePath
				sortAscending: [ :aBehavior | aBehavior sourceAnchor startPos ]).
	alterFile
		ifTrue: [ self saveMrlLogFor: aPWBObject with: mrlBehaviorStringDic.
			^ aPWBObject ]
		ifFalse: [ ^ mrlBehaviorStringDic ]
]

{ #category : #running }
QueryInsertMrlLogStringsForFunctionsInPWBObjectInSource >> saveMrlLogFor: aPWBObject with: mrlBehaviorStringDic [
	| tempFileContents file |
	file := aPWBObject sourceAnchor rootFolder asFileReference
		resolve: aPWBObject sourceAnchor fileName.
	tempFileContents := aPWBObject sourceText copy.
	mrlBehaviorStringDic
		keysAndValuesDo: [ :key :value | 
			tempFileContents := tempFileContents
				copyReplaceAll: key sourceText
				with: value ].
	aPWBObject sourceAnchor endPos: tempFileContents size.
	file writeStreamDo: [ :stream | stream << tempFileContents ]
]
