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
		baseline: self name;
		repository: ('github://', self repositoryOwner, '/', self name, ':', self commit, '/', self codeDirectory);
		onConflict: [ :ex | ex useIncoming ];
		onUpgrade: [ :ex | ex useIncoming ];
		onDowngrade: [ :ex | ex useIncoming ];
		onWarning: [ :ex | Transcript crShow: ex ].
]

{ #category : #accessing }
ExternalProjectModel >> repositoryOwner [
	^ repositoryOwner
]

{ #category : #accessing }
ExternalProjectModel >> repositoryOwner: anObject [
	repositoryOwner := anObject
]
