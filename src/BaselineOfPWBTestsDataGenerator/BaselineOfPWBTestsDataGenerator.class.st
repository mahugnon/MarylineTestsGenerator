Class {
	#name : #BaselineOfPWBTestsDataGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfPWBTestsDataGenerator
}

{ #category : #baselines }
BaselineOfPWBTestsDataGenerator >> baseline: spec [
	<baseline>
	self
		baselineOfPWBUtilities: spec;
		baselineOfPWBTracers: spec.
	spec
		for: #common
		do: [ self baselineOfPowerBuilderParser: spec.
			spec
				package: 'PWBTestsDataGenerator'
					with: [ spec requires: #('PowerBuilderParser') ];
				package: 'PWBTestsDataGenerator-Tests'
					with: [ spec requires: #('PWBTestsDataGenerator') ] ]
]

{ #category : #baselines }
BaselineOfPWBTestsDataGenerator >> baselineOfPWBTracers: spec [
	spec
		baseline: 'PWBTracers'
		with: [ spec
				repository: 'github://mahugnon/PWBTracers' ]
]

{ #category : #baselines }
BaselineOfPWBTestsDataGenerator >> baselineOfPWBUtilities: spec [
	spec
		baseline: 'PWBUtilities'
		with: [ spec
				repository: 'github://mahugnon/PWBUtilities' ]
]

{ #category : #baselines }
BaselineOfPWBTestsDataGenerator >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://moosetechnology/PowerBuilderParser' ]
]
