Class {
	#name : #BaselineOfMaryline,
	#superclass : #BaselineOf,
	#category : #BaselineOfMaryline
}

{ #category : #baselines }
BaselineOfMaryline >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self baselineOfPowerBuilderParser: spec.
			spec
				package: 'Maryline'
				with: [ spec requires: #('PowerBuilderParser') ] ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfP3: spec [
	spec
		baseline: 'P3'
		with: [ spec
				repository: 'github://svenvc/P3:v1.2' ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://moosetechnology/PowerBuilderParser:master' ]
]
