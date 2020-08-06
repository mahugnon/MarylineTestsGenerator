Class {
	#name : #MrlPWBUnitTestStringType,
	#superclass : #MrlPWBUnitTestvariable,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestStringType class >> accept: aString [
	^ {'string'} anySatisfy: [ :any | any = aString asLowercase ]
]

{ #category : #printing }
MrlPWBUnitTestStringType >> printPWBDeclarationScript [
	^ String
		streamContents: [ :stream | 
			stream
				<< type;
				space;
				<< name;
				crlf;
				<< name;
				space;
				nextPut: $=;
				space;
				nextPut: $";
				<< value;
				nextPut: $";
				crlf ]
]
