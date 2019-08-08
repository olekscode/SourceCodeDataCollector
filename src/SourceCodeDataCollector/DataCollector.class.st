Class {
	#name : #DataCollector,
	#superclass : #Object,
	#category : #SourceCodeDataCollector
}

{ #category : #'as yet unclassified' }
DataCollector >> collectClassDataFrom: aClass [
	| model |
	model := ClassModel new.
	model name: aClass name.
	
	model methods: (
		aClass methods collect: [ :method |
			self collectMethodDataFrom: method ]) asArray.
		
	^ model
]

{ #category : #'as yet unclassified' }
DataCollector >> collectDataFromProject: aProjectModel [
	aProjectModel packages: (
		(self packagesOfProject: aProjectModel) collect: [ :package |
			self collectPackageDataFrom: package ]) asArray.
	
	^ aProjectModel
]

{ #category : #'as yet unclassified' }
DataCollector >> collectMethodDataFrom: aMethod [
	| model |
	model := MethodModel new.
	model name: aMethod selector.
	model sourceCode: aMethod sourceCode.
	model linesOfCode: aMethod linesOfCode.
	^ model
]

{ #category : #'as yet unclassified' }
DataCollector >> collectPackageDataFrom: aPackage [
	| model |
	model := PackageModel new.
	model name: aPackage name.
	
	model classes: (
		aPackage classes collect: [ :aClass |
			self collectClassDataFrom: aClass ]) asArray.
		
	^ model
]

{ #category : #'as yet unclassified' }
DataCollector >> packagesOfProject: aProjectModel [	
	^ Smalltalk image packages
		select: [ :p | p name beginsWith: aProjectModel prefix ].
]
