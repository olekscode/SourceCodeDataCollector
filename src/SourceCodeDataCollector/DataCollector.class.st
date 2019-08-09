Class {
	#name : #DataCollector,
	#superclass : #Object,
	#category : #'SourceCodeDataCollector-Controllers'
}

{ #category : #'as yet unclassified' }
DataCollector >> collectClassDataFrom: aClass [
	^ ClassModel new
		name: aClass name;
		methods: (aClass methods collect: [ :method |
			self collectMethodDataFrom: method ]) asArray.
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromCollectionOfProjects: aCollectionOfProjectModels [
	^ aCollectionOfProjectModels collect: [ :projectModel |
		self collectDataFromProject: projectModel ].
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromCollectionOfProjects: aCollectionOfProjectModels andWriteToCsv: aFileReference [
	| df |
	self collectDataFromCollectionOfProjects: aCollectionOfProjectModels.
	df := DataFrameBuilder new fromCollectionOfProjects: aCollectionOfProjectModels.
	df writeToCsv: aFileReference
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromProject: aProjectModel [
	aProjectModel packages: (
		(self packagesOfProject: aProjectModel) collect: [ :package |
			self collectPackageDataFrom: package ]) asArray.
	
	^ aProjectModel
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromProject: aProjectModel andWriteToCsv: aFileReference [
	| df |
	self collectDataFromProject: aProjectModel.
	df := DataFrameBuilder new fromProject: aProjectModel.
	df writeToCsv: aFileReference
]

{ #category : #'as yet unclassified' }
DataCollector >> collectMethodDataFrom: aMethod [
	^ MethodModel new
		name: aMethod selector;
		protocol: aMethod protocol;
		sourceCode: aMethod sourceCode;
		linesOfCode: aMethod linesOfCode.
]

{ #category : #'as yet unclassified' }
DataCollector >> collectPackageDataFrom: aPackage [
	^ PackageModel new
		name: aPackage name;
		classes: (aPackage classes collect: [ :aClass |
			self collectClassDataFrom: aClass ]) asArray.
]

{ #category : #'as yet unclassified' }
DataCollector >> packagesOfProject: aProjectModel [	
	^ aProjectModel prefixes flatCollect: [ :prefix |
		Smalltalk image packages
			select: [ :p | p name beginsWith: prefix ] ].
]
