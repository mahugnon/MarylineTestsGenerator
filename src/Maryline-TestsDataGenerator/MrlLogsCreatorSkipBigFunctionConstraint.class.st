Class {
	#name : #MrlLogsCreatorSkipBigFunctionConstraint,
	#superclass : #MrlLogsCreatorAbstractConstraint,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
MrlLogsCreatorSkipBigFunctionConstraint >> apply [
	| loggers |
	loggers := (logsCreator loggers values flatten
		select: [ :log | 
			(constraint
				allSatisfy: [ :const | (log focus isRelatedTo: const) not ])
				and: [ log isEmptyLogger not ] ]) groupedBy: #position.
	logsCreator loggers: loggers
]
