Class {
	#name : #MRLInvocationArgumentTests,
	#superclass : #MRLAbstractTests,
	#category : #'Maryline-Tests'
}

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlAfterLogString [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation) first
				mrlAfterLogString
		equals: 'f_mrl_log().log(adw_dlq,"TestFuctionA","adw_dlq-after-TestFuctionA")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testMrlBeforeLogString [
	self
		assert:
			(QueryInvocationArguments runOn: testInvocation) first
				mrlBeforeLogString
		equals:
			'f_mrl_log().log(adw_dlq,"TestFuctionA","adw_dlq-before-TestFuctionA")'
]

{ #category : #tests }
MRLInvocationArgumentTests >> testSaveMrlLogStrings [
]
