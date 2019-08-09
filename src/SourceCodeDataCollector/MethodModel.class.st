Class {
	#name : #MethodModel,
	#superclass : #Object,
	#instVars : [
		'name',
		'protocol',
		'sourceCode',
		'linesOfCode',
		'tokens',
		'subtokens'
	],
	#category : #'SourceCodeDataCollector-Models'
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

{ #category : #accessing }
MethodModel >> subtokens [
	^ subtokens
]

{ #category : #accessing }
MethodModel >> subtokens: anObject [
	subtokens := anObject
]

{ #category : #accessing }
MethodModel >> tokens [
	^ tokens
]

{ #category : #accessing }
MethodModel >> tokens: anObject [
	tokens := anObject
]
