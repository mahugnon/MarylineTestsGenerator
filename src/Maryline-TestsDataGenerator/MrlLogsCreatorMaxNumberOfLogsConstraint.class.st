Class {
	#name : #MrlLogsCreatorMaxNumberOfLogsConstraint,
	#superclass : #MrlLogsCreatorAbstractConstraint,
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #accessing }
MrlLogsCreatorMaxNumberOfLogsConstraint >> apply [
	| logs |
	logs := ((logsCreator loggers values flatten
		reject: [ :each | each isEmptyLogger ]) sortAscending: #position)
		copyFrom: 1
		to: constraint.
	logsCreator loggers: (logs groupedBy: #position)
]
