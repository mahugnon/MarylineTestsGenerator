"
I represent a timestamp  log
"
Class {
	#name : #PWBTimestampLogger,
	#superclass : #PWBAbstractLogger,
	#category : #'PWBTestsDataGenerator-Logger'
}

{ #category : #'as yet unclassified' }
PWBTimestampLogger class >> loggerFor: aFamixPWBBehavior [
	^ self new
		focus: aFamixPWBBehavior;
		yourself
]

{ #category : #testing }
PWBTimestampLogger >> belongsTo [
	^ focus
]

{ #category : #testing }
PWBTimestampLogger >> isTimestampLogger [
	^ true
]

{ #category : #logging }
PWBTimestampLogger >> logOn: aStream [
	aStream
		lf;
		<< ' string ls_time ';
		lf;
		<<
			'ls_time = String(DateTime(Today(), Now()),"DD/MM/YYYY HH:MM:SS:FFF")';
		lf
]

{ #category : #sorting }
PWBTimestampLogger >> sortingKey [
^5
]
