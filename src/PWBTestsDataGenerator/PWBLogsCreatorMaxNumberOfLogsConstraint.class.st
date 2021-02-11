"
I am a constraint  to apply for Loggers. When I am applyied, I limit the number of logs of a Powerbuilder object
"
Class {
	#name : #PWBLogsCreatorMaxNumberOfLogsConstraint,
	#superclass : #PWBLogsCreatorAbstractConstraint,
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #api }
PWBLogsCreatorMaxNumberOfLogsConstraint >> apply [
	| logs finalLogs functionList currentFunction |
	logs := (logsCreator loggers reject: [ :each | each isEmptyLogger ])
		sortAscending: #position.
	constraint >= logs size
		ifTrue: [ ^ self ].
	finalLogs := OrderedCollection new.
	functionList := OrderedCollection new.
	currentFunction := nil.
	1 to: constraint do: [ :iter | 
		| log |
		log := logs at: iter.
		log belongsTo = currentFunction
			ifFalse: [ finalLogs addAll: functionList.
				currentFunction := log belongsTo.
				functionList := OrderedCollection new ].
		functionList add: log ].
	logsCreator loggers: finalLogs
]
