Class {
	#name : #MrlJobs,
	#superclass : #Object,
	#instVars : [
		'izyProtectTarget'
	],
	#category : #'Maryline-TestsGenerator'
}

{ #category : #accessing }
MrlJobs >> izyProtectRootFolder [
	^ izyProtectTarget parent
]
