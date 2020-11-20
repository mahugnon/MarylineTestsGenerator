Class {
	#name : #MrlObjectGroupLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'name',
		'constraints'
	],
	#category : #'PWBTestsDataGenerator-Models'
}

{ #category : #'as yet unclassified' }
MrlObjectGroupLogsCreator class >> loggerWithAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createwithAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectGroupLogsCreator class >> loggerWithAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerWithAccessFor: objects
]

{ #category : #'as yet unclassified' }
MrlObjectGroupLogsCreator class >> loggerWithoutAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createWithoutAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
MrlObjectGroupLogsCreator class >> loggerWithoutAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctionsFromToscaSenarios
		keys.
	^ self loggerWithoutAccessFor: objects
]

{ #category : #'as yet unclassified' }
MrlObjectGroupLogsCreator class >> updateData: aBuilder [
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
						yourself);	addConstraint:
					(MrlLogsCreatorSkipBigFunctionConstraint new
						name: 'w_traitement';
						constraint: {'wf_iuo_trt'};
						yourself);
				save ]
]

{ #category : #adding }
MrlObjectGroupLogsCreator >> addConstraint: aConstraint [
	loggers
		detect: [ :logger | logger name = aConstraint name ]
		ifFound: [ :founded | founded addConstraint: aConstraint ]
]

{ #category : #api }
MrlObjectGroupLogsCreator >> createWithoutAccessLoggers [
	loggers := focus
		collect: [ :each | MrlObjectLogsCreator loggerWithoutAccessFor: each ]
]

{ #category : #api }
MrlObjectGroupLogsCreator >> createwithAccessLoggers [
	loggers := focus
		collect: [ :each | MrlObjectLogsCreator loggerWithAccessFor: each ]
]

{ #category : #accessing }
MrlObjectGroupLogsCreator >> focus: aCollection [ 
	focus := aCollection
]

{ #category : #accessing }
MrlObjectGroupLogsCreator >> loggers [
	^ loggers
]

{ #category : #printing }
MrlObjectGroupLogsCreator >> printOn: aStrem [
	^ aStrem
		<< 'Group';
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #actions }
MrlObjectGroupLogsCreator >> save [
	loggers do: #save
]
