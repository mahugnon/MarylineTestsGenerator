Class {
	#name : #BaselineOfMaryline,
	#superclass : #BaselineOf,
	#category : #BaselineOfMaryline
}

{ #category : #baselines }
BaselineOfMaryline >> baseline: spec [
	<baseline>
	self
		baselineOfP3: spec;
		baselineOfGlorp: spec;
		baselineOfPWBUtilities: spec;
		baselineOfPWBLoggers: spec .
	spec
		for: #common
		do: [ self baselineOfPowerBuilderParser: spec.
			spec
				package: 'Iceberg-ProjectLocator';
				package: 'Maryline-TestsDataGenerator'
					with: [ spec requires: #('PowerBuilderParser') ];
				package: 'Maryline-TestsDataGenerator-Model'
					with: [ spec requires: #('Glorp' 'P3' 'P3-Glorp') ];
				package: 'Maryline-TestsGenerator'
					with: [ spec requires: #('Glorp' 'P3') ];
				package: 'Maryline-TestsDataGenerator-Tests'
					with: [ spec requires: #('Maryline-TestsDataGenerator') ] ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfGlorp: spec [
	spec
		baseline: 'Glorp'
		with: [ spec
				repository: 'github://mahugnon/glorp:32-Glorp-doesnt-support-ssl-connexion-for-P3' ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfP3: spec [
	spec
		baseline: 'P3'
		with: [ spec
				repository: 'github://mahugnon/P3:29-P3DatabaseDriver-should-have-connectSSL' ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfPWBLoggers: spec [
	spec
		baseline: 'PWBLoggers'
		with: [ spec
				repository: 'github://mahugnon/PWBLogger:master' ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfPWBUtilities: spec [
	spec
		baseline: 'PWBUtilities'
		with: [ spec
				repository: 'github://mahugnon/PWBUtilities:master' ]
]

{ #category : #baselines }
BaselineOfMaryline >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://moosetechnology/PowerBuilderParser:master' ]
]
