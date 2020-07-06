Class {
	#name : #MRLAbstractQuery,
	#superclass : #Object,
	#category : #'Maryline-Queries'
}

{ #category : #running }
MRLAbstractQuery class >> runOn: anObject [
	^ self new runOn: anObject
]

{ #category : #running }
MRLAbstractQuery >> runOn: anObject [
	^ self subclassResponsibility
]
