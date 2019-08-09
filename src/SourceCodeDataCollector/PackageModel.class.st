Class {
	#name : #PackageModel,
	#superclass : #Object,
	#instVars : [
		'classes',
		'name'
	],
	#category : #'SourceCodeDataCollector-Models'
}

{ #category : #accessing }
PackageModel >> classes [
	^ classes
]

{ #category : #accessing }
PackageModel >> classes: anObject [
	classes := anObject
]

{ #category : #accessing }
PackageModel >> name [
	^ name
]

{ #category : #accessing }
PackageModel >> name: anObject [
	name := anObject
]
