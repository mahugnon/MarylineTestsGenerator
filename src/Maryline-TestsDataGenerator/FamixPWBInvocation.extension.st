Extension { #name : #FamixPWBInvocation }

{ #category : #'*Maryline-TestsDataGenerator' }
FamixPWBInvocation >> saveMrlLogStringsForArgumentsInAnchor [
	| mrlArguments |
	mrlArguments := QueryInvocationArguments runOn: self.
	mrlArguments isEmptyOrNil
		ifFalse: [ mrlArguments do: #saveMrlLogStrings ]
]
