Class {
	#name : #DataFrameBuilder,
	#superclass : #Object,
	#category : #'SourceCodeDataCollector-Controllers'
}

{ #category : #'instance creation' }
DataFrameBuilder >> columnNamesForOneProject [ 
	^ #(package class protocol method linesOfCode tokens subtokens)
]

{ #category : #'instance creation' }
DataFrameBuilder >> columnNamesForProjects [
	^ #(project), self columnNamesForOneProject
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
		columnNames: self columnNamesForOneProject.
]

{ #category : #'instance creation' }
DataFrameBuilder >> fromProjects: aCollectionOfProjectModels [
	| rows |
	rows := aCollectionOfProjectModels flatCollect: [ :projectModel |
		projectModel packages flatCollect: [ :packageModel |
			packageModel classes flatCollect: [ :classModel |
				classModel methods collect: [ :methodModel |
					self
						rowFromProject: projectModel
						package: packageModel
						class: classModel
						method: methodModel ] ] ] ].
	
	^ DataFrame
		withRows: rows
		columnNames: self columnNamesForProjects.
]

{ #category : #'instance creation' }
DataFrameBuilder >> rowFromPackage: aPackageModel class: aClassModel method: aMethodModel [
	^ {
		aPackageModel name .
		aClassModel name .
		aMethodModel protocol .
		aMethodModel name .
		aMethodModel linesOfCode .
		' ' join: aMethodModel tokens .
		' ' join: aMethodModel subtokens
	}
]

{ #category : #'instance creation' }
DataFrameBuilder >> rowFromProject: aProjectModel package: aPackageModel class: aClassModel method: aMethodModel [
	^ { aProjectModel name }, (self rowFromPackage: aPackageModel class: aClassModel method: aMethodModel)
]
