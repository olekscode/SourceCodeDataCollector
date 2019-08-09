Class {
	#name : #DataFrameBuilder,
	#superclass : #Object,
	#category : #'SourceCodeDataCollector-Controllers'
}

{ #category : #'instance creation' }
DataFrameBuilder >> columnNames [ 
	^ #(package class protocol method linesOfCode)
]

{ #category : #'instance creation' }
DataFrameBuilder >> fromProject: aProjectModel [
	| rows |
	rows := aProjectModel packages flatCollect: [ :packageModel |
		packageModel classes flatCollect: [ :classModel |
			classModel methods collect: [ :methodModel |
				self
					rowFromPackage: packageModel
					class: classModel
					method: methodModel ] ] ].
	
	^ DataFrame
		withRows: rows
		columnNames: self columnNames.
]

{ #category : #'instance creation' }
DataFrameBuilder >> rowFromPackage: aPackageModel class: aClassModel method: aMethodModel [
	^ {
		aPackageModel name .
		aClassModel name .
		aMethodModel protocol .
		aMethodModel name .
		aMethodModel linesOfCode
	}
]
