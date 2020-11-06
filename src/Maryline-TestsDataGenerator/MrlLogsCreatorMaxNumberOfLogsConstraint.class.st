Class {
	#name : #MrlLogsCreatorMaxNumberOfLogsConstraint,
	#superclass : #MrlLogsCreatorAbstractConstraint,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
MrlLogsCreatorMaxNumberOfLogsConstraint >> apply [
	| logs |
	logs := (logsCreator loggers values flatten
		reject: [ :each | each isEmptyLogger ]) copyFrom: 1 to: constraint.
	logsCreator loggers: (logs groupedBy: #position)
]
