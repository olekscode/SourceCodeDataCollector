Class {
	#name : #ProjectModel,
	#superclass : #Object,
	#instVars : [
		'packages',
		'prefixes',
		'name'
	],
	#category : #'SourceCodeDataCollector-Models'
}

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
