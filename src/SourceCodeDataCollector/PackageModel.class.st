Class {
	#name : #PackageModel,
	#superclass : #Object,
	#instVars : [
		'methods',
		'name'
	],
	#category : #'SourceCodeDataCollector-Models'
}

{ #category : #accessing }
PackageModel >> methods [
	^ methods
]

{ #category : #accessing }
PackageModel >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
PackageModel >> name [
	^ name
]

{ #category : #accessing }
PackageModel >> name: anObject [
	name := anObject
]
