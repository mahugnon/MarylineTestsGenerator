"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMarylineTestsDataGenerator,
	#superclass : #PackageManifest,
	#category : #'Maryline-TestsDataGenerator-Manifest'
}

{ #category : #'code-critics' }
ManifestMarylineTestsDataGenerator class >> ruleRBMethodSourceContainsLinefeedsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#InsertLogInFunction)) #'2020-10-08T15:16:27.243041+02:00') )
]
