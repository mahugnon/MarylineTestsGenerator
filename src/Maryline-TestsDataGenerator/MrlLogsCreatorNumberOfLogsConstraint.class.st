Class {
	#name : #MrlLogsCreatorNumberOfLogsConstraint,
	#superclass : #MrlLogsCreatorAbstractConstraint,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
MrlLogsCreatorNumberOfLogsConstraint >> apply [
	logsCreator loggers: (logsCreator loggers copyFrom: 1 to: constraint)
]
