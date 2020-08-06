Class {
	#name : #MrlPWBUnitTestPrimitiveType,
	#superclass : #MrlPWBUnitTestvariable,
	#category : #'Maryline-TestsGenerator-Core'
}

{ #category : #visiting }
MrlPWBUnitTestPrimitiveType class >> accept: aString [
	^ {'boolean' . 'double' . 'int' . 'integer' . 'date' . 'long'}
		anySatisfy: [ :any | any = aString asLowercase ]
]

{ #category : #printing }
MrlPWBUnitTestPrimitiveType >> printPWBDeclarationScript [
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
				space.
			value printOn: stream.
			stream crlf ]
]
