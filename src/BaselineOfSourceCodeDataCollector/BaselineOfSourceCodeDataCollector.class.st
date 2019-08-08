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
				
		"Packages"
		spec 
			package: 'SourceCodeDataCollector';
			package: 'SourceCodeDataCollector-Tests' with: [ spec requires: #('SourceCodeDataCollector') ]].
]
