Class {
	#name : #ExternalProjectModel,
	#superclass : #ProjectModel,
	#instVars : [
		'repositoryOwner',
		'commit',
		'codeDirectory'
	],
	#category : #'SourceCodeDataCollector-Models'
}

{ #category : #accessing }
ExternalProjectModel >> codeDirectory [
	^ codeDirectory
]

{ #category : #accessing }
ExternalProjectModel >> codeDirectory: anObject [
	codeDirectory := anObject
]

{ #category : #accessing }
ExternalProjectModel >> commit [
	^ commit
]

{ #category : #accessing }
ExternalProjectModel >> commit: anObject [
	commit := anObject
]

{ #category : #'as yet unclassified' }
ExternalProjectModel >> metacello [
	^ Metacello new
		repository: ('github://', self repositoryOwner, '/', self name, ':', self commit, '/', self codeDirectory);
		baseline: self name;
		onConflict: [ :ex | ex useIncoming ].
]

{ #category : #accessing }
ExternalProjectModel >> repositoryOwner [
	^ repositoryOwner
]

{ #category : #accessing }
ExternalProjectModel >> repositoryOwner: anObject [
	repositoryOwner := anObject
]
