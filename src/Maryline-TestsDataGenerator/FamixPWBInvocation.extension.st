Extension { #name : #FamixPWBInvocation }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBInvocation >> saveMrlLogStringsForArgumentsInAnchor [
	| arguments |
	arguments := QueryInvocationArguments runOn: self.
	arguments isEmptyOrNil
		ifFalse: [ arguments do: #saveMrlLogStrings ]
]
