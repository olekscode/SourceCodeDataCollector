Class {
	#name : #BaselineOfSourceCodeDataCollector,
	#superclass : #BaselineOf,
	#category : #BaselineOfSourceCodeDataCollector
}

{ #category : #baselines }
BaselineOfSourceCodeDataCollector >> baselineOf: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'DataFrame'
			with: [ spec repository: 'github://PolyMathOrg/DataFrame/src' ].
			
		spec 
			baseline: 'PharoCodeTokenizer'
			with: [ spec repository: 'github://olekscode/PharoCodeTokenizer/src' ].
				
		"Packages"
		spec 
			package: 'SourceCodeDataCollector' with: [ spec requires: #(DataFrame PharoCodeTokenizer) ];
			package: 'SourceCodeDataCollector-Tests' with: [ spec requires: #(SourceCodeDataCollector) ]].
]
