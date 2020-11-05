Class {
	#name : #MrlLogsCreatorSkipBigFunctionConstraint,
	#superclass : #MrlLogsCreatorAbstractConstraint,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
MrlLogsCreatorSkipBigFunctionConstraint >> apply [
	logsCreator
		loggers:
			(logsCreator loggers
				select:
					[ :log | constraint allSatisfy: [ :const | (log focus isRelatedTo: const )not] ])
]
