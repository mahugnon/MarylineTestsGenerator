Extension { #name : #String }

{ #category : #'*PWBTestsDataGenerator' }
String >> logOut [
	'/Users/honore/Desktop/logout.sru' asFileReference
		writeStreamDo: [ :myStream | myStream << self ]
]
