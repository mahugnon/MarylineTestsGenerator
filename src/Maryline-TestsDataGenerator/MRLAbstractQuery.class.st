Class {
	#name : #MRLAbstractQuery,
	#superclass : #Object,
	#instVars : [
		'alterFile'
	],
	#category : #'Maryline-TestsDataGenerator-Queries'
}

{ #category : #running }
MRLAbstractQuery class >> runOn: anObject [
	^ self new runOn: anObject
]

{ #category : #accessing }
MRLAbstractQuery >> alterFile [
	^ alterFile
]

{ #category : #accessing }
MRLAbstractQuery >> alterFile: anObject [
	alterFile := anObject
]

{ #category : #running }
MRLAbstractQuery >> runOn: anObject [
	^ self subclassResponsibility
]
