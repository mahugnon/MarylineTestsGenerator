Class {
	#name : #MrlPWBUnitTestComplexType,
	#superclass : #MrlPWBUnitTestvariable,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestComplexType class >> accept: aString [
	^ aString asLowercase = 'pbobject'
]

{ #category : #printing }
MrlPWBUnitTestComplexType >> printPWBDeclarationScript [
	^ String
		streamContents: [ :stream | 
			stream
				<< beforeValue;
				space;
				<< name;
				crlf;
				<< name;
				space;
				nextPut: $=;
				space;
				<< 'create';
				space;
				<< beforeValue;
				crlf ]
]
