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
	logsCreator
		loggers:
			(logsCreator loggers
				select: [ :log | 
					(constraint
						noneSatisfy: [ :functionName | log belongsTo name = functionName ])
						and: [ log isEmptyLogger not ] ])
]
