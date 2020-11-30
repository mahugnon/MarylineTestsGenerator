Class {
	#name : #PWBObjectGroupLogsCreator,
	#superclass : #Object,
	#instVars : [
		'focus',
		'loggers',
		'name',
		'constraints'
	],
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator class >> loggerWithAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createwithAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator class >> loggerWithAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerWithAccessFor: objects
]

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator class >> loggerWithoutAccessFor: aCollection [
	^ self new
		focus: aCollection;
		createWithoutAccessLoggers;
		yourself
]

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator class >> loggerWithoutAccessForModel: aFamixPWBModel [
	| objects |
	objects := aFamixPWBModel getBusinessRuleFunctionsFromToscaSenarios
		keys.
	^ self loggerWithoutAccessFor: objects
]

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator class >> updateData: aBuilder [
	<worldMenu>
	(aBuilder item: #LoadingLastestTickets)
		parent: #PWBTools;
		help: 'Insert logs in model root folder';
		label: 'Generate mrl logs';
		action: [ | model |
			model := MooseModel root first.
			(self loggerWithoutAccessForModel: model)
				addConstraint:
					(PWBLogsCreatorSkipBigFunctionConstraint new
						name: 'uo_traitement_liq_cal';
						constraint:
							{'uf_calcul_plafond' . 'uf_calcul_exp_limite_suite'.
							'uf_init_adherent'};
						yourself);
				addConstraint:
					(PWBLogsCreatorMaxNumberOfLogsConstraint new
						name: 'uo_traitement_liq_cal';
						constraint: 207;
						yourself);
				addConstraint:
					(PWBLogsCreatorSkipBigFunctionConstraint new
						name: 'uo_traitement_ech_maj';
						constraint: {'uf_rech_prem_ech'};
						yourself);
				addConstraint:
					(PWBLogsCreatorSkipBigFunctionConstraint new
						name: 'w_traitement';
						constraint: {'wf_iuo_trt'};
						yourself);
				addConstraint:
					(PWBLogsCreatorSkipBigFunctionConstraint new
						name: 'w_traitement';
						constraint: {'wf_iuo_trt'};
						yourself);
				addConstraint:
					(PWBLogsCreatorSkipBigFunctionConstraint new
						name: 'f_videsinull';
						constraint: {'f_videsinull'};
						yourself);
				save ]
]

{ #category : #adding }
PWBObjectGroupLogsCreator >> addConstraint: aConstraint [
	loggers
		detect: [ :logger | logger name = aConstraint name ]
		ifFound: [ :founded | founded addConstraint: aConstraint ]
]

{ #category : #api }
PWBObjectGroupLogsCreator >> createWithoutAccessLoggers [
	loggers := focus
		collect: [ :each | PWBObjectLogsCreator loggerWithoutAccessFor: each ]
]

{ #category : #api }
PWBObjectGroupLogsCreator >> createwithAccessLoggers [
	loggers := focus
		collect: [ :each | PWBObjectLogsCreator loggerWithAccessFor: each ]
]

{ #category : #accessing }
PWBObjectGroupLogsCreator >> focus: aCollection [ 
	focus := aCollection
]

{ #category : #accessing }
PWBObjectGroupLogsCreator >> loggers [
	^ loggers
]

{ #category : #printing }
PWBObjectGroupLogsCreator >> printOn: aStrem [
	^ aStrem
		<< 'Group';
		space;
		<< '(';
		<< loggers size asString;
		<< ')'
]

{ #category : #actions }
PWBObjectGroupLogsCreator >> save [
	loggers do: #save
]
