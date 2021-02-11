Extension { #name : #FamixPWBParameter }

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBParameter >> isParameter [
	^ true
]

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBParameter >> isRelatedTo: aString [ 
^self behavioral  name = aString 
]
