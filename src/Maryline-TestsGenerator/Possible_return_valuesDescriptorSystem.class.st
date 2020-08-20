Class {
	#name : #'Possible_return_valuesDescriptorSystem',
	#superclass : #DescriptorSystem,
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #accessing }
Possible_return_valuesDescriptorSystem >> allTableNames [
	"Return a list of all the table names that this system uses."
	^#('Possible_return_values')
]

{ #category : #'as yet unclassified' }
Possible_return_valuesDescriptorSystem >> classModelForMaryline_invocation_logs: aClassModel [
	aClassModel newAttributeNamed: #value.
	aClassModel newAttributeNamed: #function_name.
	aClassModel newAttributeNamed: #pwb_ligne_number
]

{ #category : #'as yet unclassified' }
Possible_return_valuesDescriptorSystem >> descriptorForMrlPossibleReturnValues: aDescriptor [
	| table |
	table := self tableNamed: 'Possible_return_values'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping)
		from: #value
		to: (table fieldNamed: 'value').
	(aDescriptor newMapping: DirectMapping)
		from: #function_name
		to: (table fieldNamed: 'function_name').
	(aDescriptor newMapping: DirectMapping)
		from: #pwb_ligne_number 
		to: (table fieldNamed: 'pwb_ligne_number').
	
]

{ #category : #'as yet unclassified' }
Possible_return_valuesDescriptorSystem >> tableForPOSSIBLE_RETURN_VALUES: aTable [ 
	aTable createFieldNamed: 'value' type: (platform varChar: 100).
	aTable
		createFieldNamed: 'function_name'
		type: (platform varChar: 100).
	aTable
		createFieldNamed: 'pwb_ligne_number'
		type: (platform varChar: 100).
	(aTable createFieldNamed: 'pwb_object' type: (platform varChar: 100))
		
]
