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
BaselineOfMaryline >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://moosetechnology/PowerBuilderParser:e9005ce166be9d408769f1ab6fd9babdaa20338d/src' ]
]
