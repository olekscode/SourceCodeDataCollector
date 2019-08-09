Class {
	#name : #ProjectModel,
	#superclass : #Object,
	#instVars : [
		'packages',
		'url',
		'commit',
		'prefixes',
		'name'
	],
	#category : #'SourceCodeDataCollector-Models'
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
ProjectModel >> prefixes [
	^ prefixes
]

{ #category : #accessing }
ProjectModel >> prefixes: anObject [
	prefixes := anObject
]

{ #category : #accessing }
ProjectModel >> url [
	^ url
]

{ #category : #accessing }
ProjectModel >> url: anObject [
	url := anObject
]
