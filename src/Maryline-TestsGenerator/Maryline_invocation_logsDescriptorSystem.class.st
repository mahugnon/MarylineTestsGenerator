Class {
	#name : #'Maryline_invocation_logsDescriptorSystem',
	#superclass : #DescriptorSystem,
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #'accessing structure variables' }
Maryline_invocation_logsDescriptorSystem class >> driver [
	<script>
	PharoDatabaseAccessor DefaultDriver: P3DatabaseDriver
]

{ #category : #accessing }
Maryline_invocation_logsDescriptorSystem >> allTableNames [
	"Return a list of all the table names that this system uses."

	^ #('Maryline_invocation_logs')
]

{ #category : #'as yet unclassified' }
Maryline_invocation_logsDescriptorSystem >> classModelForMaryline_invocation_logs: aClassModel [
	aClassModel newAttributeNamed: #pwb_object.
	aClassModel newAttributeNamed: #pwb_behavior_calling.
	aClassModel newAttributeNamed: #pwb_behavior_called.
	aClassModel newAttributeNamed: #pwb_ligne_number.
	aClassModel newAttributeNamed: #timestamp.
	aClassModel newAttributeNamed: #return_Value
]

{ #category : #'as yet unclassified' }
Maryline_invocation_logsDescriptorSystem >> descriptorForMrlInvocationLog: aDescriptor [
	| table |
	table := self tableNamed: 'Maryline_invocation_logs'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_object
		to: (table fieldNamed: 'pwb_object').
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_behavior_calling
		to: (table fieldNamed: 'pwb_behavior_calling').
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_behavior_called
		to: (table fieldNamed: 'pwb_behavior_called').
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_ligne_number
		to: (table fieldNamed: 'pwb_ligne_number').
	(aDescriptor newMapping: DirectMapping)
		from: #timestamp
		to: (table fieldNamed: 'timestamp').
	(aDescriptor newMapping: DirectMapping)
		from: #return_Value
		to: (table fieldNamed: 'return_Value')
]

{ #category : #'as yet unclassified' }
Maryline_invocation_logsDescriptorSystem >> tableForMARYLINE_INVOCATION_LOGS: aTable [
	aTable createFieldNamed: 'pwb_object' type: (platform varChar: 100).
	aTable
		createFieldNamed: 'pwb_behavior_calling'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'pwb_behavior_called'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'pwb_ligne_number'
		type: (platform varChar: 100).
	(aTable createFieldNamed: 'timestamp' type: (platform varChar: 100))
		bePrimaryKey.
	aTable createFieldNamed: 'return_Value' type: (platform varChar: 100)
]
