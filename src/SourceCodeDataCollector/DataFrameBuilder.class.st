Class {
	#name : #DataFrameBuilder,
	#superclass : #Object,
	#category : #'SourceCodeDataCollector-Controllers'
}

{ #category : #'instance creation' }
DataFrameBuilder >> allWordsTableColumnNames [
	^ #(id words)
]

{ #category : #'instance creation' }
DataFrameBuilder >> allWordsTableFrom: projectModels [
	| rows |
	rows := projectModels flatCollect: [ :projectModel |
		projectModel packages flatCollect: [ :packageModel |
			packageModel methods collect: [ :methodModel |
				{
					methodModel id .
					' ' join: methodModel allWords
				} ] ] ].
	
	^ DataFrame
		withRows: rows
		columnNames: self allWordsTableColumnNames.
]

{ #category : #'instance creation' }
DataFrameBuilder >> methodsTableColumnNames [
	^ #(id project package class protocol selector linesOfCode isTestClass) 
]

{ #category : #'instance creation' }
DataFrameBuilder >> methodsTableFrom: projectModels [
	| rows |
	rows := projectModels flatCollect: [ :projectModel |
		projectModel packages flatCollect: [ :packageModel |
			packageModel methods collect: [ :methodModel |
				{
					methodModel id .
					projectModel name .
					packageModel name .
					methodModel methodClass name .
					methodModel protocol .
					methodModel name .
					methodModel linesOfCode .
					methodModel isTestClass
				} ] ] ] .
	
	^ DataFrame
		withRows: rows
		columnNames: self methodsTableColumnNames.
]

{ #category : #'instance creation' }
DataFrameBuilder >> sourcesTableColumnNames [
	^ #(id sourceCode)
]

{ #category : #'instance creation' }
DataFrameBuilder >> sourcesTableFrom: projectModels [
	| rows |
	rows := projectModels flatCollect: [ :projectModel |
		projectModel packages flatCollect: [ :packageModel |
			packageModel methods collect: [ :methodModel |
				{
					methodModel id .
					' ' join: methodModel sourceCode substrings
				} ] ] ].
	
	^ DataFrame
		withRows: rows
		columnNames: self sourcesTableColumnNames.
]

{ #category : #'instance creation' }
DataFrameBuilder >> subtokensTableColumnNames [
	^ #(id subtokens)
]

{ #category : #'instance creation' }
DataFrameBuilder >> subtokensTableFrom: projectModels [
	| rows |
	rows := projectModels flatCollect: [ :projectModel |
		projectModel packages flatCollect: [ :packageModel |
			packageModel methods collect: [ :methodModel |
				{
					methodModel id .
					' ' join: methodModel subtokens
				} ] ] ].
	
	^ DataFrame
		withRows: rows
		columnNames: self subtokensTableColumnNames.
]

{ #category : #'instance creation' }
DataFrameBuilder >> tokensTableColumnNames [
	^ #(id tokens tokenTypes)
]

{ #category : #'instance creation' }
DataFrameBuilder >> tokensTableFrom: projectModels [
	| rows |
	rows := projectModels flatCollect: [ :projectModel |
		projectModel packages flatCollect: [ :packageModel |
			packageModel methods collect: [ :methodModel |
				{
					methodModel id .
					String tab join: methodModel tokens .
					' ' join: methodModel tokenTypes
				} ] ] ].
	
	^ DataFrame
		withRows: rows
		columnNames: self tokensTableColumnNames.
]

{ #category : #'instance creation' }
DataFrameBuilder >> wordsTableColumnNames [
	^ #(id words)
]

{ #category : #'instance creation' }
DataFrameBuilder >> wordsTableFrom: projectModels [
	| rows |
	rows := projectModels flatCollect: [ :projectModel |
		projectModel packages flatCollect: [ :packageModel |
			packageModel methods collect: [ :methodModel |
				{
					methodModel id .
					' ' join: methodModel words
				} ] ] ].
	
	^ DataFrame
		withRows: rows
		columnNames: self wordsTableColumnNames.
]
