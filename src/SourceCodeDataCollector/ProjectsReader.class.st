Class {
	#name : #ProjectsReader,
	#superclass : #Object,
	#category : #'SourceCodeDataCollector-Models'
}

{ #category : #'instance creation' }
ProjectsReader class >> readExternalProjectsFrom: aFileReference [
	| projects |
	projects := DataFrame readFromCsv: aFileReference.
	
	^ projects asArrayOfRows collect: [ :projectRow |
		ExternalProjectModel new
			name: (projectRow at: 'name');
			prefixes: (projectRow at: 'prefixes') substrings;
			repositoryOwner: (projectRow at: 'repositoryOwner');
			commit: (projectRow at: 'commit');
			codeDirectory: ((projectRow at: 'codeDirectory') ifNil: '');
			yourself ].
]

{ #category : #'instance creation' }
ProjectsReader class >> readInternalProjectsFrom: aFileReference [
	| projects |
	projects := DataFrame readFromCsv: aFileReference.
	
	^ projects asArrayOfRows collect: [ :projectRow |
		ProjectModel new
			name: (projectRow at: 'name');
			prefixes: (projectRow at: 'prefixes') substrings;
			yourself ].
]
