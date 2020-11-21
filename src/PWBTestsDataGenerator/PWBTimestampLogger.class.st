Class {
	#name : #PWBTimestampLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
PWBTimestampLogger class >> loggerFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		yourself
]

{ #category : #accessing }
PWBTimestampLogger >> belongsTo [
	^ focus
]

{ #category : #testing }
PWBTimestampLogger >> isTimestampLogger [
	^ true
]

{ #category : #'as yet unclassified' }
PWBTimestampLogger >> logOn: aStream [
	aStream
		<<
			' string ls_time = String(DateTime(Today(), Now()),"DD/MM/YYYY HH:MM:SS:FFF");';
		space
]
