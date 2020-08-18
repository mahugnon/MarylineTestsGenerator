Class {
	#name : #ParameterDescriptorSystem,
	#superclass : #DescriptorSystem,
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #'accessing structure variables' }
ParameterDescriptorSystem class >> driver [
	<script>
	PharoDatabaseAccessor DefaultDriver: P3DatabaseDriver
]

{ #category : #accessing }
ParameterDescriptorSystem >> allTableNames [
	"Return a list of all the table names that this system uses."
	^#('Parameter')
]

{ #category : #'as yet unclassified' }
ParameterDescriptorSystem >> classModelForParameter: aClassModel [
	aClassModel newAttributeNamed: #pwb_parameter_name.
	aClassModel newAttributeNamed: #pwb_parameter_value.
	aClassModel newAttributeNamed: #pwb_parameter_syntax.
	"aClassModel newAttributeNamed: #pwb_parameter_selectSql."
	aClassModel newAttributeNamed: #pwb_parameter_value_context.
	aClassModel newAttributeNamed: #pwb_ligne_number.
	aClassModel newAttributeNamed: #timestamp
]

{ #category : #'as yet unclassified' }
ParameterDescriptorSystem >> descriptorForMrlParameter: aDescriptor [
	| table |
	table := self tableNamed: 'Parameter'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_parameter_name
		to: (table fieldNamed: 'pwb_parameter_name').
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_parameter_value
		to: (table fieldNamed: 'pwb_parameter_value').
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_parameter_syntax
		to: (table fieldNamed: 'pwb_parameter_syntax').
	"(aDescriptor newMapping: DirectMapping)
		from: #pwb_parameter_selectSql
		to: (table fieldNamed: 'pwb_parameter_selectSql')."
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_parameter_value_context
		to: (table fieldNamed: 'pwb_parameter_value_context').
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_ligne_number
		to: (table fieldNamed: 'pwb_ligne_number').
	(aDescriptor newMapping: DirectMapping)
		from: #timestamp
		to: (table fieldNamed: 'timestamp')
]

{ #category : #'as yet unclassified' }
ParameterDescriptorSystem >> tableForPARAMETER: aTable [
	aTable
		createFieldNamed: 'pwb_parameter_name'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'pwb_parameter_value'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'pwb_parameter_syntax'
		type: (platform varChar: 100).
	"aTable
		createFieldNamed: 'pwb_parameter_selectSql'
		type: (platform varChar: 100)."
	aTable
		createFieldNamed: 'pwb_parameter_value_context'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'pwb_ligne_number'
		type: (platform varChar: 100).
	(aTable createFieldNamed: 'timestamp' type: (platform varChar: 100))
		bePrimaryKey
]
