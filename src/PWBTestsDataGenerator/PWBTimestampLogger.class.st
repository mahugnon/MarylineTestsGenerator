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
		lf;
		<< ' string ls_time ';
		lf;
		<<
			'ls_time = String(DateTime(Today(), Now()),"DD/MM/YYYY HH:MM:SS:FFF")';
		lf
]

{ #category : #'as yet unclassified' }
PWBTimestampLogger >> sortingKey [
^5
]
