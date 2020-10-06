Extension { #name : #FamixPWBmajorObject }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBmajorObject >> insertMarylineLogs [
	| sourceTextWithLogs |
	sourceTextWithLogs := self sourceAnchor completeText.
	(self businessRulePath
		sortAscending: [ :each | each sourceAnchor startPos ])
		do: [ :aMethod | 
			sourceTextWithLogs := aMethod
				insertParametersAccessAndReturnLogIn: sourceTextWithLogs ].
	self sourceAnchor fileReference
		writeStreamDo: [ :stream | stream << sourceTextWithLogs ]
]
