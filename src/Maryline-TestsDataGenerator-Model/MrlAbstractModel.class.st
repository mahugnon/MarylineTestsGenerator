Class {
	#name : #MrlAbstractModel,
	#superclass : #Object,
	#category : #'Maryline-TestsDataGenerator-Model'
}

{ #category : #'as yet unclassified' }
MrlAbstractModel class >> loadAll [
	^ self session read: self
]

{ #category : #'as yet unclassified' }
MrlAbstractModel class >> loadWhere: aBlock [
	^ self session read: self where: aBlock
]

{ #category : #accessing }
MrlAbstractModel class >> login [
	| login |
	login := Login new
		database: PostgreSQLPlatform new;
		username: 'honore';
		password: 'honorem';
		host: '192.168.43.161';
		port: '5432';
		databaseName: 'maryline_database'.
	(DatabaseAccessor forLogin: login) login.
	login secure: true.
	^ login
]

{ #category : #'as yet unclassified' }
MrlAbstractModel class >> session [
	^ self subclassResponsibility
]
