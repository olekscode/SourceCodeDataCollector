Class {
	#name : #MethodModel,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'methodClass',
		'protocol',
		'sourceCode',
		'linesOfCode',
		'tokens',
		'tokenTypes',
		'subtokens',
		'words',
		'allWords'
	],
	#category : #'SourceCodeDataCollector-Models'
}

{ #category : #accessing }
MethodModel >> allWords [
	^ allWords
]

{ #category : #accessing }
MethodModel >> allWords: anObject [
	allWords := anObject
]

{ #category : #accessing }
MethodModel >> id [
	^ id
]

{ #category : #accessing }
MethodModel >> id: anObject [
	id := anObject
]

{ #category : #accessing }
MethodModel >> linesOfCode [
	^ linesOfCode
]

{ #category : #accessing }
MethodModel >> linesOfCode: anObject [
	linesOfCode := anObject
]

{ #category : #accessing }
MethodModel >> methodClass [
	^ methodClass
]

{ #category : #accessing }
MethodModel >> methodClass: anObject [
	methodClass := anObject
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
MethodModel >> tokenTypes [
	^ tokenTypes
]

{ #category : #accessing }
MethodModel >> tokenTypes: anObject [
	tokenTypes := anObject
]

{ #category : #accessing }
MethodModel >> tokens [
	^ tokens
]

{ #category : #accessing }
MethodModel >> tokens: anObject [
	tokens := anObject
]

{ #category : #accessing }
MethodModel >> words [
	^ words
]

{ #category : #accessing }
MethodModel >> words: anObject [
	words := anObject
]
