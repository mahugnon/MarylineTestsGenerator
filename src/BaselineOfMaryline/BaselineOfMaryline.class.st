Class {
	#name : #BaselineOfMaryline,
	#superclass : #BaselineOf,
	#category : #BaselineOfMaryline
}

{ #category : #baselines }
BaselineOfMaryline >> baseline: spec [
	<baseline>
	self baselineOfIcebergProjectLocator: spec.
	spec
		for: #common
		do: [ self baselineOfPowerBuilderParser: spec.
			spec
				package: 'Maryline'
				with: [ spec requires: #('PowerBuilderParser' 'IcebergProjectLocator') ] ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfIcebergProjectLocator: spec [
	spec
		baseline: 'IcebergProjectLocator'
		with: [ spec
				repository: 'github://mahugnon/IcebergProjectLocator:master/src' ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://moosetechnology/PowerBuilderParser:master' ]
]
