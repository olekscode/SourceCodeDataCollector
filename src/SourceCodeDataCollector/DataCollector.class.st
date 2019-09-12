Class {
	#name : #DataCollector,
	#superclass : #Object,
	#category : #'SourceCodeDataCollector-Controllers'
}

{ #category : #'as yet unclassified' }
DataCollector >> collectClassDataFrom: aClass [
	| methods count |
	methods := OrderedCollection new.
	count := 1.
	
	aClass methods
		do: [ :method |
			methods add: (self collectMethodDataFrom: method).
			count := count + 1 ]
		displayingProgress: [ :method | '(', count asString, '/', aClass methods size asString, ' methods) ', method selector ].
	
	^ ClassModel new
		name: aClass name;
		methods: methods asArray.
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromProject: aProjectModel [
	| packages packageModels count |
	packageModels := OrderedCollection new.
	count := 1.
	
	packages := self packagesOfProject: aProjectModel.
	
	packages
		do: [ :package |
			packageModels add: (self collectPackageDataFrom: package).
			count := count + 1 ]
		displayingProgress: [ :package | '(', count asString, '/', packages size asString, ' packages) ', package name ].
	
	aProjectModel packages: packageModels asArray.
	
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
DataCollector >> collectDataFromProjects: aCollectionOfProjectModels [
	| count |
	count := 1.
	
	aCollectionOfProjectModels
		do: [ :projectModel |
			self collectDataFromProject: projectModel.
			count := count + 1 ]
		displayingProgress: [ :projectModel | '(', count asString, '/', aCollectionOfProjectModels size asString, ' projects) ', projectModel name ].
	
	^ aCollectionOfProjectModels.
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromProjects: aCollectionOfProjectModels andWriteToCsv: aFileReference [
	| df |
	self collectDataFromProjects: aCollectionOfProjectModels.
	df := DataFrameBuilder new fromProjects: aCollectionOfProjectModels.
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
	| classes counter |
	classes := OrderedCollection new.
	counter := 0.
	
	aPackage classes
		do: [ :aClass |
			classes add: (self collectClassDataFrom: aClass).
			counter := counter + 1 ]
		displayingProgress: [ :aClass | '(', counter asString, '/', aPackage classes size asString, ' classes) ', aClass name ].

	^ PackageModel new
		name: aPackage name;
		classes: classes asArray.
]

{ #category : #'as yet unclassified' }
DataCollector >> packagesOfProject: aProjectModel [	
	^ aProjectModel prefixes flatCollect: [ :prefix |
		Smalltalk image packages
			select: [ :p | p name beginsWith: prefix ] ].
]
