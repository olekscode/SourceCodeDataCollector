Class {
	#name : #ExternalDataCollector,
	#superclass : #DataCollector,
	#category : #SourceCodeDataCollector
}

{ #category : #accessing }
ExternalDataCollector >> collectMethods [
	self projectModels do: [ :projectModel |
		projectModel load.
		self methodCollector collectMethodsFromProject: projectModel.
		
		self createAndSaveTablesFrom: { projectModel }
			into: (self dataDirectory / projectModel name) ].
]

{ #category : #accessing }
ExternalDataCollector >> createAndSaveTables [
	"do nothing"
]

{ #category : #'as yet unclassified' }
ExternalDataCollector >> dataDirectory [
	^ self workingDirectory / 'data' / 'external'
]

{ #category : #'as yet unclassified' }
ExternalDataCollector >> projectsFile [
	^ self workingDirectory / 'projects' / 'external-projects.csv'.
]

{ #category : #accessing }
ExternalDataCollector >> readProjectsMetadata [
	projectModels := ProjectsReader readExternalProjectsFrom: self projectsFile.
]
