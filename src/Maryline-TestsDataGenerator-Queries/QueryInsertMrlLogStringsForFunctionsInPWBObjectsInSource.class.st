Class {
	#name : #QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource,
	#superclass : #QueryInsertMrlLogStringsForFunctionsInPWBObjectInSource,
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
QueryInsertMrlLogStringsForFunctionsInPWBObjectsInSource >> runOn: aCollection [
	| mrlDic |
	mrlDic := (aCollection
		collect: [ :aPWBObject | aPWBObject -> (super runOn: aPWBObject) ])
		asDictionary.
	mrlDic
		keysAndValuesDo:
			[ :aPWBObject :mrlBehaviorStringDic | self saveMrlLogFor: aPWBObject with: mrlBehaviorStringDic ]
]
