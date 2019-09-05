Class {
	#name : #ProjectLoader,
	#superclass : #Object,
	#category : #'SourceCodeDataCollector-Models'
}

{ #category : #private }
ProjectLoader class >> loadFrom: aProjectModel [
	Metacello new
		repository: 'github://', aProjectModel repositoryOwner, '/', aProjectModel name, ':', aProjectModel commit, '/', aProjectModel codeDirectory;
		baseline: aProjectModel name;
		load.
]
