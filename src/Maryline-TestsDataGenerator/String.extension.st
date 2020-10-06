Extension { #name : #String }

{ #category : #'*Maryline-TestsDataGenerator' }
String >> logOut [
	'/Users/honore/Desktop/logout.sru' asFileReference
		writeStreamDo: [ :myStream | myStream << self ]
]
