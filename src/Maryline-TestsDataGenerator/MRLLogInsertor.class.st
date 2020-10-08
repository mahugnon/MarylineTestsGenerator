Class {
	#name : #MRLLogInsertor,
	#superclass : #Object,
	#instVars : [
		'model',
		'fileOriginalSource'
	],
	#category : #'Maryline-TestsDataGenerator'
}

{ #category : #accessing }
MRLLogInsertor >> fileOriginalSource [
	^ fileOriginalSource
]

{ #category : #accessing }
MRLLogInsertor >> fileOriginalSource: anObject [
	fileOriginalSource := anObject
]

{ #category : #'as yet unclassified' }
MRLLogInsertor >> insertLogOfVariables: aCollectionOfParametersOrAccesses tagged: tag [
	^ String streamContents: [ :stream | 
			aCollectionOfParametersOrAccesses do: [ :aVarOrAccess |
				aVarOrAccess logOn: stream context: tag ] ]
]

{ #category : #'as yet unclassified' }
MRLLogInsertor >> insertLogsAfter: function forVariables: aCollectionOfVariables in: modifiedCode [
	self flag: #TODO.
	^ modifiedCode
]

{ #category : #'as yet unclassified' }
MRLLogInsertor >> insertLogsBefore: function forVariables: aCollectionOfVariables in: modifiedCode [
	| signatureText functionOriginalCode functionCodeWithLogs |
	functionOriginalCode := self originalSourceText: function sourceAnchor.
	signatureText := self originalSourceText: function signature sourceAnchor.
	functionCodeWithLogs := String
		streamContents: [ :stream | 
			stream
				<< signatureText;
				crlf;
				<< (self insertLogOfVariables: aCollectionOfVariables tagged: 'before' );
				crlf.
			stream << (functionOriginalCode copyReplaceAll: signatureText with: '') ].
	^ modifiedCode copyReplaceAll: functionOriginalCode with: functionCodeWithLogs
]

{ #category : #'as yet unclassified' }
MRLLogInsertor >> insertLogsForPWBFunction: function inCode: modifiedCode [
	" Becareful that #insertLogsBefore:forVariables:in: should be called first and #insertLogsAfter:forVariables:in: second" 
	^ self
			insertLogsAfter: function
			forVariables: (function parameters , function accessedAttributes)
			in: (self
				insertLogsBefore: function
				forVariables: (function parameters , function accessedAttributes)
				in: modifiedCode)
]

{ #category : #'as yet unclassified' }
MRLLogInsertor >> insertLogsForPWBObject: aPWBObject [
	| modifiedCode |
	fileOriginalSource := aPWBObject sourceAnchor completeText.
	modifiedCode := fileOriginalSource.
	aPWBObject getBusinessRuleFunctions do: [:fct |
		modifiedCode := self insertLogsForPWBFunction: fct inCode: modifiedCode ].
	^modifiedCode
]

{ #category : #'as yet unclassified' }
MRLLogInsertor >> insertLogsForPWBObjects: aCollection [
	aCollection do: [ :obj | self insertLogsForPWBObject: obj ]
	
]

{ #category : #accessing }
MRLLogInsertor >> model [
	^ model
]

{ #category : #accessing }
MRLLogInsertor >> model: anObject [
	model := anObject
]

{ #category : #'as yet unclassified' }
MRLLogInsertor >> originalSourceText: anAnchor [
	^fileOriginalSource copyFrom: anAnchor startPos to: anAnchor endPos
]
