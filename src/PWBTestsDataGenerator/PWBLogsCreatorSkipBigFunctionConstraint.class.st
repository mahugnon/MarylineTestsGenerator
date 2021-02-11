"
I am a constraint  to apply for Loggers. When I am applyied, I remove big function specified in my configuration
"
Class {
	#name : #PWBLogsCreatorSkipBigFunctionConstraint,
	#superclass : #PWBLogsCreatorAbstractConstraint,
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #api }
PWBLogsCreatorSkipBigFunctionConstraint >> apply [
	| loggers |
	loggers := (logsCreator loggers values flatten
		select: [ :log | 
			(constraint
				allSatisfy: [ :functionName | log belongsTo name ~= functionName ])
				and: [ log isEmptyLogger not ] ]) groupedBy: #position.
	logsCreator loggers: loggers
]
