Extension { #name : #FamixPWBModel }

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBModel >> businessRuleFunctions: aCollection [ 
	businessRuleFunctions := aCollection
]

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBModel >> getBusinessRuleFunctions [
	businessRuleFunctions ifNil: [ self getRuntimeBehaviors ].
	businessRuleFunctions ifEmpty: [ self getRuntimeBehaviors ].
	^ businessRuleFunctions
]

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBModel >> getRuntimeBehaviors [
	businessRuleFunctions := OrderedDictionary new.
	MrlBehavior loadAll
		do: [ :each | 
			self allModelMethods
				detect: [ :m | 
					m parentType isNotNil
						and: [ m parentType name = each pwb_object
								and: [ each behavior_name = m name ] ] ]
				ifFound: [ :founded | 
					businessRuleFunctions
						at: founded parentType
						ifAbsentPut: [ OrderedCollection new ].
					(businessRuleFunctions at: founded parentType) add: founded ]
				ifNone: [  ] ]
]

{ #category : #'*PWBTestsDataGenerator' }
FamixPWBModel >> resetLogState [
	self allModelBehaviourals
		do: [ :each | each privateState attributeAt: #logState put: false ]
]
