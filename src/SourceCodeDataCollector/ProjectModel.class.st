Class {
	#name : #ProjectModel,
	#superclass : #Object,
	#instVars : [
		'packages',
		'url',
		'commit',
		'prefix',
		'name'
	],
	#category : #SourceCodeDataCollector
}

{ #category : #accessing }
ProjectModel >> commit [
	^ commit
]

{ #category : #accessing }
ProjectModel >> commit: anObject [
	commit := anObject
]

{ #category : #accessing }
ProjectModel >> name [
	^ name
]

{ #category : #accessing }
ProjectModel >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ProjectModel >> packages [
	^ packages
]

{ #category : #accessing }
ProjectModel >> packages: anObject [
	packages := anObject
]

{ #category : #accessing }
ProjectModel >> prefix [
	^ prefix
]

{ #category : #accessing }
ProjectModel >> prefix: anObject [
	prefix := anObject
]

{ #category : #accessing }
ProjectModel >> url [
	^ url
]

{ #category : #accessing }
ProjectModel >> url: anObject [
	url := anObject
]
