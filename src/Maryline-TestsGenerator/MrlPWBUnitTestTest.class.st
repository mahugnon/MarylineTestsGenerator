Class {
	#name : #MrlPWBUnitTestTest,
	#superclass : #TestCase,
	#category : #'Maryline-TestsGenerator-Tests'
}

{ #category : #tests }
MrlPWBUnitTestTest >> testEmptyTestUnitScript [
	self
		assert:
			(MrlPWBUnitTest new
				name: 'pwbTest1';
				printPWBDeclarationScript)
		equals: 
		'event pwbTest1();

return;
end event
'
]
