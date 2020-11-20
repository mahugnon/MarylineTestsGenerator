Class {
	#name : #MrlJobs,
	#superclass : #Object,
	#instVars : [
		'izyProtectTarget'
	],
	#category : #PWBTestsGenerator
}

{ #category : #accessing }
MrlJobs >> izyProtectRootFolder [
	^ izyProtectTarget parent
]
