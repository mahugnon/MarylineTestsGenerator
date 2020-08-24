Class {
	#name : #MrlParameterDescriptorSystem,
	#superclass : #MrlDescriptorAbstractSystem,
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #accessing }
MrlParameterDescriptorSystem >> allTableNames [
	"Return a list of all the table names that this system uses."
	^#('Maryline_parameter')
]

{ #category : #'as yet unclassified' }
MrlParameterDescriptorSystem >> classModelForMaryline_parameter: aClassModel [
	aClassModel newAttributeNamed: #behavior_id.
	aClassModel newAttributeNamed: #parameter_id.
	aClassModel newAttributeNamed: #parameter_name.
	aClassModel newAttributeNamed: #parameter_before_value.
	aClassModel newAttributeNamed: #parameter_syntax.
	"aClassModel newAttributeNamed: #parameter_selectSql."
	aClassModel newAttributeNamed: #parameter_after_value.
	aClassModel newAttributeNamed: #line_number.
	aClassModel newAttributeNamed: #timestamp
]

{ #category : #'as yet unclassified' }
MrlParameterDescriptorSystem >> descriptorForMrlParameter: aDescriptor [
	| table |
	table := self tableNamed: 'public."Maryline_parameter"'.
	
	aDescriptor table: table.
	
	(aDescriptor newMapping: DirectMapping)
		from: #parameter_name
		to: (table fieldNamed: 'parameter_name').
		
	(aDescriptor newMapping: DirectMapping)
		from: #parameter_before_value
		to: (table fieldNamed: 'parameter_before_value').
		
	(aDescriptor newMapping: DirectMapping)
		from: #parameter_after_value
		to: (table fieldNamed: 'parameter_after_value').
		
	(aDescriptor newMapping: DirectMapping)
		from: #parameter_syntax
		to: (table fieldNamed: 'parameter_syntax').
		
	"(aDescriptor newMapping: DirectMapping)
		from: #parameter_selectSql
		to: (table fieldNamed: 'parameter_selectSql').
	"	
	(aDescriptor newMapping: DirectMapping)
		from: #line_number
		to: (table fieldNamed: 'line_number').
		
	(aDescriptor newMapping: DirectMapping)
		from: #behavior_id
		to: (table fieldNamed: 'behavior_id').
		
	(aDescriptor newMapping: DirectMapping)
		from: #parameter_id
		to: (table fieldNamed: 'parameter_id').
		
	(aDescriptor newMapping: DirectMapping)
		from: #timestamp
		to: (table fieldNamed: 'timestamp')
]

{ #category : #'as yet unclassified' }
MrlParameterDescriptorSystem >> tableForMARYLINE_PARAMETER: aTable [
	| fk_parameter |
	(aTable createFieldNamed: 'parameter_id' type: platform int4)
		bePrimaryKey.
	fk_parameter := aTable
		createFieldNamed: 'behavior_id'
		type: platform int4.
	aTable
		createFieldNamed: 'parameter_name'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'parameter_after_value'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'parameter_syntax'
		type: (platform varChar: 100).
		
		"	aTable
		createFieldNamed: 'parameter_selectSql'
		type: (platform varChar: 100).
		"
	aTable
		createFieldNamed: 'parameter_before_value'
		type: (platform varChar: 100).
	aTable createFieldNamed: 'line_number' type: (platform varChar: 100).
	aTable createFieldNamed: 'timestamp' type: (platform varChar: 100).
	aTable
		addForeignKeyFrom: fk_parameter
		to: ((self tableNamed: 'MARYLINE_PARAMETER') fieldNamed: 'behavior_id')
]
