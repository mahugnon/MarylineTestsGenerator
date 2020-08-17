Class {
	#name : #MrlParameter,
	#superclass : #Object,
	#instVars : [
		'pwb_parameter_name',
		'pwb_parameter_value',
		'pwb_parameter_syntax',
		'pwb_parameter_value_context',
		'pwb_ligne_number',
		'timestamp'
	],
	#classVars : [
		'session'
	],
	#category : #'Maryline-TestsGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlParameter class >> loadAll [
	^ self session read: self
]

{ #category : #'as yet unclassified' }
MrlParameter class >> loadWhere: aBlock [
	^ self session read: self where: aBlock
]

{ #category : #initialization }
MrlParameter class >> resetSession [
	session := nil
]

{ #category : #accessing }
MrlParameter class >> session [
	session
		ifNil: [ | login |
			login := Login new
				database: PostgreSQLPlatform new;
				username: 'honore';
				password: 'honorem';
				host: '192.168.43.161';
				port: '5432';
				databaseName: 'maryline_database'.
			(DatabaseAccessor forLogin: login) login.
			login secure: true.
			session := ParameterDescriptorSystem sessionForLogin: login.
			session login ].
	^ session
]
