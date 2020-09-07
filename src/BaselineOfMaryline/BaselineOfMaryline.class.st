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
		baselineOfGlorp: spec.
	spec
		for: #common
		do: [ self baselineOfPowerBuilderParser: spec.
			spec
				package: 'Maryline'
				with: [ spec requires: #('PowerBuilderParser' 'Glorp' 'P3') ] ]
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
BaselineOfMaryline >> baselineOfPowerBuilderParser: spec [
	spec
		baseline: 'PowerBuilderParser'
		with: [ spec
				repository: 'github://moosetechnology/PowerBuilderParser:master' ]
]
