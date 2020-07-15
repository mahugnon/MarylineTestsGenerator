Class {
	#name : #MrlTestCasesGenerator,
	#superclass : #Object,
	#instVars : [
		'entityName',
		'entitySuper'
	],
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #accessing }
MrlTestCasesGenerator >> entityName [
	^ entityName
]

{ #category : #accessing }
MrlTestCasesGenerator >> entityName: anObject [
	entityName := anObject
]

{ #category : #accessing }
MrlTestCasesGenerator >> entitySuper [
	^ entitySuper
]

{ #category : #accessing }
MrlTestCasesGenerator >> entitySuper: anObject [
	entitySuper := anObject
]

{ #category : #api }
MrlTestCasesGenerator >> generate [
	^ self
		generateFooterIn: (self generateHeaderIn: (MrlPWBEntities getType: self entitySuper))
]

{ #category : #api }
MrlTestCasesGenerator >> generateFooterIn: aMrLPWBEntity [
	^ aMrLPWBEntity
		footer:
			(String
				streamContents: [ :stream | 
					stream
						<< 'on ';
						<< entityName;
						<< '.create';
						crlf;
						<< 'call super::create';
						crlf;
						<< 'end on';
						crlf;
						crlf;
						<< 'on ';
						<< entityName;
						<< '.destroy';
						crlf;
						<< 'call super::destroy';
						crlf;
						<< 'end on';
						crlf ])
]

{ #category : #api }
MrlTestCasesGenerator >> generateHeaderIn: aMrLPWBEntity [
	^ aMrLPWBEntity
		header:
			(String
				streamContents: [ :stream | 
					stream
						<< '$PBExportHeader$';
						<< entityName;
						<<
							'.sru
forward
global type ';
						<< entityName;
						<< ' from ';
						<< entitySuper;
						crlf;
						<<
							'end type
end forward';
						crlf ])
]
