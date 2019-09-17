Class {
	#name : #DataCollector,
	#superclass : #Object,
	#instVars : [
		'workingDirectory',
		'projectModels',
		'methodCollector',
		'tableBuilder'
	],
	#category : #SourceCodeDataCollector
}

{ #category : #'as yet unclassified' }
DataCollector class >> new [
	self shouldNotImplement 
]

{ #category : #'as yet unclassified' }
DataCollector class >> withWorkingDirectory: aDirectory [
	^ super new
		workingDirectory: aDirectory;
		yourself.
]

{ #category : #'as yet unclassified' }
DataCollector >> allWordsFileIn: aDirectory [
	^ aDirectory / 'all_words.csv'
]

{ #category : #'as yet unclassified' }
DataCollector >> collectData [
	self readProjectsMetadata.
	self collectMethods.
	self createAndSaveTables.
]

{ #category : #'as yet unclassified' }
DataCollector >> collectMethods [ 
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveAllWordsTableFrom: aCollectionOfProjectModels into: aDirectory [
	| table |
	table := self tableBuilder allWordsTableFrom: aCollectionOfProjectModels.
	self writeTable: table toCsv: (self allWordsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveMethodsTableFrom: aCollectionOfProjectModels into: aDirectory [
	| table |
	table := self tableBuilder methodsTableFrom: aCollectionOfProjectModels.
	self writeTable: table toCsv: (self methodsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveSourcesTableFrom: aCollectionOfProjectModels into: aDirectory [
	| table |
	table := self tableBuilder sourcesTableFrom: aCollectionOfProjectModels.
	self writeTable: table toCsv: (self sourcesFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveSubtokensTableFrom: aCollectionOfProjectModels into: aDirectory [
	| table |
	table := self tableBuilder subtokensTableFrom: aCollectionOfProjectModels.
	self writeTable: table toCsv: (self subtokensFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveTables [
	self createAndSaveTablesFrom: self projectModels into: self dataDirectory
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveTablesFrom: aCollectionOfProjectModels [
	self createAndSaveTablesFrom: aCollectionOfProjectModels into: self dataDirectory
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveTablesFrom: aCollectionOfProjectModels into: aDirectory [
	aDirectory ensureCreateDirectory.
	self createAndSaveMethodsTableFrom: aCollectionOfProjectModels into: aDirectory.
	self createAndSaveSourcesTableFrom: aCollectionOfProjectModels into: aDirectory.
	self createAndSaveTokensTableFrom: aCollectionOfProjectModels into: aDirectory.
	self createAndSaveSubtokensTableFrom: aCollectionOfProjectModels into: aDirectory.
	self createAndSaveWordsTableFrom: aCollectionOfProjectModels into: aDirectory.
	self createAndSaveAllWordsTableFrom: aCollectionOfProjectModels into: aDirectory.
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveTokensTableFrom: aCollectionOfProjectModels into: aDirectory [
	| table |
	table := self tableBuilder tokensTableFrom: aCollectionOfProjectModels.
	self writeTable: table toCsv: (self tokensFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveWordsTableFrom: aCollectionOfProjectModels into: aDirectory [
	| table |
	table := self tableBuilder wordsTableFrom: aCollectionOfProjectModels.
	self writeTable: table toCsv: (self wordsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> dataDirectory [
	self subclassResponsibility 
]

{ #category : #initialization }
DataCollector >> initialize [ 
	super initialize.
	methodCollector := MethodCollector new.
	tableBuilder := DataFrameBuilder new.
]

{ #category : #accessing }
DataCollector >> methodCollector [
	^ methodCollector
]

{ #category : #accessing }
DataCollector >> methodCollector: anObject [
	methodCollector := anObject
]

{ #category : #'as yet unclassified' }
DataCollector >> methodsFileIn: aDirectory [
	^ aDirectory / 'methods.csv'
]

{ #category : #accessing }
DataCollector >> projectModels [
	^ projectModels
]

{ #category : #accessing }
DataCollector >> projectModels: anObject [
	projectModels := anObject
]

{ #category : #'as yet unclassified' }
DataCollector >> readProjectsMetadata [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DataCollector >> sourcesFileIn: aDirectory [
	^ aDirectory / 'sources.csv'
]

{ #category : #'as yet unclassified' }
DataCollector >> subtokensFileIn: aDirectory [
	^ aDirectory / 'subtokens.csv'
]

{ #category : #accessing }
DataCollector >> tableBuilder [
	^ tableBuilder
]

{ #category : #accessing }
DataCollector >> tableBuilder: anObject [
	tableBuilder := anObject
]

{ #category : #'as yet unclassified' }
DataCollector >> tokensFileIn: aDirectory [
	^ aDirectory / 'tokens.csv'
]

{ #category : #'as yet unclassified' }
DataCollector >> wordsFileIn: aDirectory [
	^ aDirectory / 'words.csv'
]

{ #category : #accessing }
DataCollector >> workingDirectory [
	^ workingDirectory
]

{ #category : #accessing }
DataCollector >> workingDirectory: anObject [
	workingDirectory := anObject
]

{ #category : #'as yet unclassified' }
DataCollector >> writeTable: aDataFrame toCsv: aFile [
	aDataFrame writeToCsv: aFile.
]
