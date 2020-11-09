"
I refresh PBLs given a Powerbuilder project path.  You should feed me with a path to a .pbt file .
I suppose that orcascript 17 is installed. If not you should change the  orcascript runner.
"
Class {
	#name : #PBLRegenerator,
	#superclass : #Object,
	#instVars : [
		'pathToTarget',
		'runner'
	],
	#category : #'Maryline-TestsGenerator-Utils'
}

{ #category : #running }
PBLRegenerator class >> runOn: aPathToPowerbuilderProjectTargetString [
	^ self new
		pathToTarget: aPathToPowerbuilderProjectTargetString;
		runOcascript
]

{ #category : #api }
PBLRegenerator >> ensureCreateOrcascriptFile [
	| file |
	file := self powerbuilderProjetDirectory / 'refreshPbls.orca'.
	file exists
		ifFalse: [ file writeStreamDo: [ :stream | stream << self orcascript ] ].
	^ file
]

{ #category : #'as yet unclassified' }
PBLRegenerator >> ensurePBGFilesAreWellSet [
	(self powerbuilderProjetDirectory files
		select: [ :file | file extension = 'pbg' ])
		ifEmpty: [ PBGRefactor runOn: self powerbuilderProjetDirectory ]
]

{ #category : #initialization }
PBLRegenerator >> initialize [ 
super initialize .
runner := 'orcascr170'
]

{ #category : #accessing }
PBLRegenerator >> logFilePath [
	^ self powerbuilderProjetDirectory / 'errors.log'
]

{ #category : #api }
PBLRegenerator >> orcascript [
	^ 'start session
set debug true
scc set connect property logfile "' , self logFilePath pathString
		,
			'"
scc connect offline
scc set target "' , pathToTarget pathString
		,
			'" importonly
scc refresh target 3pass
scc close
end session
'
]

{ #category : #accessing }
PBLRegenerator >> pathToTarget [
	^ pathToTarget
]

{ #category : #accessing }
PBLRegenerator >> pathToTarget: anObject [
	pathToTarget := anObject asFileReference
]

{ #category : #'as yet unclassified' }
PBLRegenerator >> powerbuilderProjetDirectory [
	^ pathToTarget parent
]

{ #category : #'as yet unclassified' }
PBLRegenerator >> runOcascript [
	| command |
	"Orcascript will put error log in the log file"
	self ensurePBGFilesAreWellSet.
	command := self runner , String space
		, self ensureCreateOrcascriptFile pathString.
	LibC runCommand: command.
	^ self logFilePath contents
]

{ #category : #'as yet unclassified' }
PBLRegenerator >> runner [
	^ runner
]

{ #category : #accessing }
PBLRegenerator >> runner: anObject [
	runner := anObject
]
