Extension { #name : #FamixPWBInvocation }

{ #category : #'*Maryline' }
FamixPWBInvocation >> saveMrlLogStringsForArgumentsInAnchor [
	| arguments |
	arguments := QueryInvocationArguments runOn: self.
	arguments isEmptyOrNil
		ifFalse: [ arguments do: #saveMrlLogStrings ]
]
