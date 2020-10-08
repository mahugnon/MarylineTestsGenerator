Extension { #name : #FamixPWBmajorObject }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBmajorObject >> insertMarylineLogs [
	| sourceTextWithLogs |
	sourceTextWithLogs := self sourceAnchor completeText.
	(self getBusinessRuleFunctions
		sortAscending: [ :each | each sourceAnchor startPos ])
		do: [ :aMethod | 
			sourceTextWithLogs := aMethod
				insertMarylineLogIn: sourceTextWithLogs ].
	self sourceAnchor fileReference
		writeStreamDo: [ :stream | stream << sourceTextWithLogs ]
]
