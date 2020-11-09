Class {
	#name : #PBGRefactor,
	#superclass : #Object,
	#instVars : [
		'pbProjectDirectory'
	],
	#category : #'Maryline-TestsGenerator-Utils'
}

{ #category : #running }
PBGRefactor class >> runOn: aVersionnedPowerBuilderProjectPathString [
	self new
		pbProjectDirectory: aVersionnedPowerBuilderProjectPathString;
		rewritePBGFiles
]

{ #category : #copying }
PBGRefactor >> getAllPBGFiles [
	^ (pbProjectDirectory / 'ws_objects') allFiles
		select: [ :file | file extension = 'pbg' ]
]

{ #category : #'as yet unclassified' }
PBGRefactor >> newContentOf: aFile [
	| pbgContentLocation |
	pbgContentLocation := (aFile relativeToPath: pbProjectDirectory)
		parent pathString.
	^ self
		rewriteObjectsSectionOtherLines: (self rewriteObjectsSectionFirstLine: aFile with: pbgContentLocation)
		with: pbgContentLocation
]

{ #category : #accessing }
PBGRefactor >> pbProjectDirectory [
	^ pbProjectDirectory
]

{ #category : #accessing }
PBGRefactor >> pbProjectDirectory: aString [
	pbProjectDirectory := aString asFileReference
]

{ #category : #'as yet unclassified' }
PBGRefactor >> rewriteObjectsSectionFirstLine: aFile with: aFileReference [
	| pbgFirstLine |
	pbgFirstLine := '@begin Objects' , String space , String lf
		, String space , '"'.
	^ aFile contents
		copyReplaceAll: pbgFirstLine
		with: pbgFirstLine , aFileReference , '/'
]

{ #category : #'as yet unclassified' }
PBGRefactor >> rewriteObjectsSectionOtherLines: pbgFinal with: aFileReference [
	| lineBegin |
	lineBegin := ';' , String lf , String space , '"'.
	^ pbgFinal
		copyReplaceAll: lineBegin
		with: lineBegin , aFileReference , '/'
]

{ #category : #'as yet unclassified' }
PBGRefactor >> rewritePBGFiles [
	| files |
	files := self getAllPBGFiles.
	files
		do: [ :aFile | 
			(pbProjectDirectory / aFile basename)
				ensureCreateFile;
				writeStreamDo: [ :stream | stream << (self newContentOf: aFile) ] ]
]
