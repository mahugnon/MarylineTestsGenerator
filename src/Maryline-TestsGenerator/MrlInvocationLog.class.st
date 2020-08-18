Class {
	#name : #MrlInvocationLog,
	#superclass : #MrlAbstractModel,
	#instVars : [
		'pwb_object',
		'pwb_behavior_calling',
		'pwb_behavior_called',
		'pwb_ligne_number',
		'timestamp',
		'return_Value',
		'mrlParameters'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlInvocationLog class >> loadAll [
	^ super loadAll do: #loadParametersValue
]

{ #category : #'as yet unclassified' }
MrlInvocationLog class >> session [
	| session login |
	login := self login.
	session := Maryline_invocation_logsDescriptorSystem
		sessionForLogin: login.
	session login.
	^ session
]

{ #category : #'as yet unclassified' }
MrlInvocationLog >> loadParametersValue [
	mrlParameters := ((MrlParameter
		loadWhere: [ :each | each pwb_ligne_number = pwb_ligne_number ])
		groupedBy: [ :each | each pwb_parameter_name ]) asOrderedDictionary
]

{ #category : #accessing }
MrlInvocationLog >> mrlParameters [
	^ mrlParameters
]

{ #category : #accessing }
MrlInvocationLog >> mrlParameters: aDictionary [
mrlParameters := aDictionary
]
