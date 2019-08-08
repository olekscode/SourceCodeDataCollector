Class {
	#name : #ClassModel,
	#superclass : #Object,
	#instVars : [
		'methods',
		'name'
	],
	#category : #SourceCodeDataCollector
}

{ #category : #accessing }
ClassModel >> methods [
	^ methods
]

{ #category : #accessing }
ClassModel >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
ClassModel >> name [
	^ name
]

{ #category : #accessing }
ClassModel >> name: anObject [
	name := anObject
]
