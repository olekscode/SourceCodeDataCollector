Class {
	#name : #MethodModel,
	#superclass : #Object,
	#instVars : [
		'name',
		'protocol',
		'sourceCode',
		'linesOfCode'
	],
	#category : #SourceCodeDataCollector
}

{ #category : #accessing }
MethodModel >> linesOfCode [
	^ linesOfCode
]

{ #category : #accessing }
MethodModel >> linesOfCode: anObject [
	linesOfCode := anObject
]

{ #category : #accessing }
MethodModel >> name [
	^ name
]

{ #category : #accessing }
MethodModel >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MethodModel >> protocol [
	^ protocol
]

{ #category : #accessing }
MethodModel >> protocol: anObject [
	protocol := anObject
]

{ #category : #accessing }
MethodModel >> sourceCode [
	^ sourceCode
]

{ #category : #accessing }
MethodModel >> sourceCode: anObject [
	sourceCode := anObject
]
