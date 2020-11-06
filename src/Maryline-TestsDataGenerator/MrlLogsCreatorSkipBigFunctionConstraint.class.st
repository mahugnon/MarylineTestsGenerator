Class {
	#name : #MrlLogsCreatorSkipBigFunctionConstraint,
	#superclass : #MrlLogsCreatorAbstractConstraint,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #api }
MrlLogsCreatorSkipBigFunctionConstraint >> apply [
	| loggers |
	loggers := (logsCreator loggers values flatten
		select: [ :log | 
			(constraint
				allSatisfy: [ :functionName | log belongsTo name ~= functionName ])
				and: [ log isEmptyLogger not ] ]) groupedBy: #position.
	logsCreator loggers: loggers
]
