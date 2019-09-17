Class {
	#name : #InternalDataCollector,
	#superclass : #DataCollector,
	#category : #SourceCodeDataCollector
}

{ #category : #accessing }
InternalDataCollector >> collectMethods [
	self methodCollector collectMethodsFromProjects: self projectModels.
]

{ #category : #'as yet unclassified' }
InternalDataCollector >> dataDirectory [
	^ self workingDirectory / 'data' / 'internal'
]

{ #category : #'as yet unclassified' }
InternalDataCollector >> projectsFile [
	^ self workingDirectory / 'projects' / 'internal-projects.csv'.
]

{ #category : #accessing }
InternalDataCollector >> readProjectsMetadata [
	projectModels := ProjectsReader readInternalProjectsFrom: self projectsFile.
]
