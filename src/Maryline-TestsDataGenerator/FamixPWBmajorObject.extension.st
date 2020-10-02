Extension { #name : #FamixPWBmajorObject }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBmajorObject >> insertMarylineLogs [
	| sourceTextWithLogs |
	sourceTextWithLogs := self sourceText.
	self businessRulePath
		do: [ :aMethod | 
			sourceTextWithLogs := aMethod
				insertParametersWithReturnLogIn: sourceTextWithLogs ].
	'/Users/honore/Desktop/uo_result.sru' asFileReference
		writeStreamDo: [ :stream | stream << sourceTextWithLogs ].
	self sourceAnchor fileReference
		writeStreamDo: [ :stream | stream << sourceTextWithLogs ]
]
