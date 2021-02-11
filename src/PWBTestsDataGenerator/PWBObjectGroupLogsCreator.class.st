"
I'm a logger creator for a collection of  PowerBuilder objects
"
Class {
	#name : #PWBObjectGroupLogsCreator,
	#superclass : #SpPresenter,
	#instVars : [
		'focus',
		'loggers',
		'name',
		'constraints',
		'modelSelector'
	],
	#classVars : [
		'alReady'
	],
	#category : #'PWBTestsDataGenerator-LogsCreators'
}

{ #category : #specs }
PWBObjectGroupLogsCreator class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #modelSelector
			withConstraints: [ :constraint | constraint height: self toolbarHeight ];
		yourself
]

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
	objects := aFamixPWBModel getBusinessRuleFunctions keys.
	^ self loggerWithoutAccessFor: objects
]

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator class >> run [
	<example>
	| logCreator |
	logCreator := self new.
	logCreator openWithSpec
]

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator class >> updateData: aBuilder [
	<worldMenu>
	(aBuilder item: #LoadingLastestTickets)
		parent: #PWBTools;
		help: 'Insert logs in model root folder';
		label: 'Generate logs script';
		action:
				[ self run ]
]

{ #category : #adding }
PWBObjectGroupLogsCreator >> addConstraint: aConstraint [
	loggers
		detect: [ :logger | logger name = aConstraint name ]
		ifFound: [ :founded | founded addConstraint: aConstraint ]
]

{ #category : #'as yet unclassified' }
PWBObjectGroupLogsCreator >> applyConstraints [
	self
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
				yourself)
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

{ #category : #initialization }
PWBObjectGroupLogsCreator >> initializePresenters [
	modelSelector := self instantiate: SpLabelledDropList.
	modelSelector label: 'Select model:'.
	modelSelector dropList help: 'Select the PowerBuilder model'.
	modelSelector
		items: MooseModel root allModels;
		selectIndex: 1;
		display: [ :model | model name ];
		whenSelectedItemChangedDo: [ :model | 
			self window close.
			self runOn: model ]
]

{ #category : #initialization }
PWBObjectGroupLogsCreator >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'PWB Logs creator';
		initialExtent: 500@100
]

{ #category : #api }
PWBObjectGroupLogsCreator >> loggedBehaviors [
	^ self loggers flatCollect: [ :each | each loggedBehaviors ]
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

{ #category : #initialization }
PWBObjectGroupLogsCreator >> runOn: model [
	self focus: model getBusinessRuleFunctions keys.
	self createwithAccessLoggers.
	self applyConstraints
]

{ #category : #actions }
PWBObjectGroupLogsCreator >> save [
	loggers do: #save
]
