Class {
	#name : #MrlObjectsLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'name',
		'constraints'
	],
	#category : #'Maryline-TestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createwithAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerWithAccessFor: objects
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithoutAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createWithoutAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> loggerWithoutAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerWithoutAccessFor: objects
]

{ #category : #'as yet unclassified' }
MrlObjectsLogsCreator class >> updateData: aBuilder [
	<worldMenu>
	(aBuilder item: #LoadingLastestTickets)
		order: 10;
		help: 'Insert logs in model root folder';
		label: 'Generate mrl logs';
		action: [ | model |
			model := MooseModel root first.
			(self loggerWithoutAccessForModel: model)
				addConstraint:
					(MrlLogsCreatorSkipBigFunctionConstraint new
						name: 'uo_traitement_liq_cal';
						constraint: {'uf_calcul_plafond' . 'uf_calcul_exp_limite_suite'};
						yourself);
				addConstraint:
					(MrlLogsCreatorMaxNumberOfLogsConstraint new
						name: 'uo_traitement_liq_cal';
						constraint: 207;
						yourself);
				addConstraint:
					(MrlLogsCreatorSkipBigFunctionConstraint new
						name: 'uo_traitement_ech_maj';
						constraint: {'uf_rech_prem_ech'};
						yourself);
				save ]
]

{ #category : #adding }
MrlObjectsLogsCreator >> addConstraint: aConstraint [
	loggers
		detect: [ :logger | logger name = aConstraint name ]
		ifFound: [ :founded | founded addConstraint: aConstraint ]
]

{ #category : #api }
MrlObjectsLogsCreator >> createWithoutAccessLoggers [
	loggers := focus
		collect: [ :each | MrlObjectLogsCreator loggerWithoutAccessFor: each ]
]

{ #category : #api }
MrlObjectsLogsCreator >> createwithAccessLoggers [
	loggers := focus
		collect: [ :each | MrlObjectLogsCreator loggerWithAccessFor: each ]
]

{ #category : #accessing }
MrlObjectsLogsCreator >> focus: aCollection [ 
	focus := aCollection
]

{ #category : #accessing }
MrlObjectsLogsCreator >> loggers [
	^ loggers
]

{ #category : #printing }
MrlObjectsLogsCreator >> printOn: aStrem [
	^ aStrem
		<< 'Group';
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #actions }
MrlObjectsLogsCreator >> save [
	loggers do: #save
]
