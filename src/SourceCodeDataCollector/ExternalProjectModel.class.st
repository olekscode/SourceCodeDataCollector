Class {
	#name : #ExternalProjectModel,
	#superclass : #ProjectModel,
	#instVars : [
		'repositoryOwner',
		'repositoryName',
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
		baseline: self name;
		repository: ('github://', self repositoryOwner, '/', self repositoryName, ':', self commit, '/', self codeDirectory);
		onConflict: [ :ex | ex useIncoming ];
		onUpgrade: [ :ex | ex useIncoming ];
		onDowngrade: [ :ex | ex useIncoming ];
		onWarning: [ :ex | ex resume ].
]

{ #category : #accessing }
ExternalProjectModel >> repositoryName [
	^ repositoryName
]

{ #category : #accessing }
ExternalProjectModel >> repositoryName: anObject [
	repositoryName := anObject
]

{ #category : #accessing }
ExternalProjectModel >> repositoryOwner [
	^ repositoryOwner
]

{ #category : #accessing }
ExternalProjectModel >> repositoryOwner: anObject [
	repositoryOwner := anObject
]
