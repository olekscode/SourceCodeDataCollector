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
DataCollector >> collectDataFromExternalProjects [
	self readExternalProjectsMetadata.
	self collectMethodsFromExternalProjects.
	self createAndSaveExternalTables.
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromInternalProjects [
	self readInternalProjectsMetadata.
	self collectMethodsFromInternalProjects.
	self createAndSaveInternalTables.
]

{ #category : #accessing }
DataCollector >> collectMethodsFromExternalProjects [
	self projectModels do: [ :projectModel |
		projectModel metacello load.
		self methodCollector collectMethodsFromProject: projectModel ].
]

{ #category : #accessing }
DataCollector >> collectMethodsFromInternalProjects [
	self methodCollector collectMethodsFromProjects: self projectModels.
]

{ #category : #'as yet unclassified' }
DataCollector >> commentsFileIn: aDirectory [
	^ aDirectory / 'comments.csv'
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveAllWordsTableInto: aDirectory [
	| table |
	table := self tableBuilder allWordsTableFrom: self projectModels.
	self writeTable: table toCsv: (self allWordsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveCommentsTableInto: aDirectory [
	| table |
	table := self tableBuilder commentsTableFrom: self projectModels.
	self writeTable: table toCsv: (self commentsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveExternalTables [
	self createAndSaveTablesInto: self externalDataDirectory
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveInternalTables [
	self createAndSaveTablesInto: self internalDataDirectory
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveMethodsTableInto: aDirectory [
	| table |
	table := self tableBuilder methodsTableFrom: self projectModels.
	self writeTable: table toCsv: (self methodsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveSourcesTableInto: aDirectory [
	| table |
	table := self tableBuilder sourcesTableFrom: self projectModels.
	self writeTable: table toCsv: (self sourcesFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveStringsTableInto: aDirectory [
	| table |
	table := self tableBuilder stringsTableFrom: self projectModels.
	self writeTable: table toCsv: (self stringsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveSubtokensTableInto: aDirectory [
	| table |
	table := self tableBuilder subtokensTableFrom: self projectModels.
	self writeTable: table toCsv: (self subtokensFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveTablesInto: aDirectory [
	self createAndSaveMethodsTableInto: aDirectory.
	self createAndSaveSourcesTableInto: aDirectory.
	self createAndSaveTokensTableInto: aDirectory.
	self createAndSaveSubtokensTableInto: aDirectory.
	self createAndSaveWordsTableInto: aDirectory.
	self createAndSaveAllWordsTableInto: aDirectory.
	self createAndSaveCommentsTableInto: aDirectory.
	self createAndSaveStringsTableInto: aDirectory.
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveTokensTableInto: aDirectory [
	| table |
	table := self tableBuilder tokensTableFrom: self projectModels.
	self writeTable: table toCsv: (self tokensFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> createAndSaveWordsTableInto: aDirectory [
	| table |
	table := self tableBuilder wordsTableFrom: self projectModels.
	self writeTable: table toCsv: (self wordsFileIn: aDirectory).
]

{ #category : #'as yet unclassified' }
DataCollector >> dataDirectory [
	^ self workingDirectory / 'data'
]

{ #category : #'as yet unclassified' }
DataCollector >> externalDataDirectory [
	^ self dataDirectory / 'external'
]

{ #category : #'as yet unclassified' }
DataCollector >> externalProjectsFile [
	^ self workingDirectory / 'projects' / 'external-projects.csv'.
]

{ #category : #initialization }
DataCollector >> initialize [ 
	super initialize.
	methodCollector := MethodCollector new.
	tableBuilder := DataFrameBuilder new.
]

{ #category : #'as yet unclassified' }
DataCollector >> internalDataDirectory [
	^ self dataDirectory / 'internal'
]

{ #category : #'as yet unclassified' }
DataCollector >> internalProjectsFile [
	^ self workingDirectory / 'projects' / 'internal-projects.csv'.
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

{ #category : #accessing }
DataCollector >> readExternalProjectsMetadata [
	projectModels := ProjectsReader readExternalProjectsFrom: self externalProjectsFile.
]

{ #category : #accessing }
DataCollector >> readInternalProjectsMetadata [
	projectModels := ProjectsReader readInternalProjectsFrom: self internalProjectsFile.
]

{ #category : #'as yet unclassified' }
DataCollector >> sourcesFileIn: aDirectory [
	^ aDirectory / 'sources.csv'
]

{ #category : #'as yet unclassified' }
DataCollector >> start [ 	
	self collectDataFromInternalProjects.
	self collectDataFromExternalProjects.
]

{ #category : #'as yet unclassified' }
DataCollector >> stringsFileIn: aDirectory [
	^ aDirectory / 'strings.csv'
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
	aDataFrame writeToCsv: aFile withSeparator: Character tab.
]
