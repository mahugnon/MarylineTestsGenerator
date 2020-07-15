Class {
	#name : #MrlTestCase,
	#superclass : #MrlPWBEntities,
	#instVars : [
		'gloabalTypes',
		'globalName',
		'typeVariables'
	],
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #'as yet unclassified' }
MrlTestCase class >> typeName [
	^ 'TestCase'
]

{ #category : #adding }
MrlTestCase >> addCase: aMrlPWBEvent [
]

{ #category : #adding }
MrlTestCase >> addVariable: aMrlVariable [
	typeVariables add: aMrlVariable
]

{ #category : #'as yet unclassified' }
MrlTestCase >> generateVariables [
	^ String
		streamContents: [ :stream | 
			| varDic |
			varDic := typeVariables groupedBy: #visibility.
			stream
				<< 'type variables';
				crlf;
				crlf.
			varDic
				keysDo: [ :aKey | 
					stream
						<< aKey;
						<< ':';
						crlf.
					(varDic at: aKey)
						do: [ :var | 
							stream
								<< var typeName;
								space;
								<< var name;
								crlf ] ].
			stream
				crlf;
				<< 'end variables' ]
]

{ #category : #initialization }
MrlTestCase >> initialize [
	typeVariables := OrderedCollection new
]
