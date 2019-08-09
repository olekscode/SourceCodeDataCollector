# SourceCodeDataCollector
A small tool for collecting data from source code of projects written in Pharo


## Installation
To install `SourceCodeDataCollector`, go to the Playground (`Ctrl+OW`) in your fresh Pharo image and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```smalltalk
Metacello new
  baseline: 'SourceCodeDataCollector';
  repository: 'github://olekscode/SourceCodeDataCollector/src';
  load.
```

## Usage Example

```Smalltalk
dataDirectory := '/Users/oleks/Desktop/SourceCodeData' asFileReference.
file := dataDirectory / 'data.csv'.

projects := {
	ProjectModel new
		name: 'System';
		prefixes: #('System-');
		yourself .
		
	ProjectModel new
		name: 'Commander';
		prefixes: #('Commander-');
		yourself .
		
	ProjectModel new
		name: 'Debugger';
		prefixes: #('Debugger');
		yourself .
		
	ProjectModel new
		name: 'Epicea';
		prefixes: #('Epicea');
		yourself .
		
	ProjectModel new
		name: 'Fuel';
		prefixes: #('Fuel-');
		yourself .
		
	ProjectModel new
		name: 'Graphics';
		prefixes: #('Graphics-');
		yourself .
		
	ProjectModel new
		name: 'Kernel';
		prefixes: #('Kernel');
		yourself .
		
	ProjectModel new
		name: 'Keymapping';
		prefixes: #('Keymapping-');
		yourself .
		
	ProjectModel new
		name: 'Metacello';
		prefixes: #('Metacello');
		yourself .
		
	ProjectModel new
		name: 'Monticello';
		prefixes: #('Monticello');
		yourself .
		
	ProjectModel new
		name: 'Network';
		prefixes: #('Network-');
		yourself .
		
	ProjectModel new
		name: 'Calypso';
		prefixes: #('Calypso-');
		yourself .
		
	ProjectModel new
		name: 'Collections';
		prefixes: #('Collections-');
		yourself .
		
	ProjectModel new
		name: 'Morphic';
		prefixes: #('Morphic-');
		yourself .
		
	ProjectModel new
		name: 'AST';
		prefixes: #('AST-');
		yourself .
		
	ProjectModel new
		name: 'Athens';
		prefixes: #('Athens-');
		yourself .
		
	ProjectModel new
		name: 'OpalCompiler';
		prefixes: #('OpalCompiler-');
		yourself .
		
	ProjectModel new
		name: 'OSWindow';
		prefixes: #('OSWindow-');
		yourself .
		
	ProjectModel new
		name: 'Ombu';
		prefixes: #('Ombu');
		yourself .
		
	ProjectModel new
		name: 'Polymorph';
		prefixes: #('Polymorph-');
		yourself .
		
	ProjectModel new
		name: 'Refactoring';
		prefixes: #('Refactoring-');
		yourself .
		
	ProjectModel new
		name: 'Refactoring2';
		prefixes: #('Refactoring2-');
		yourself .
		
	ProjectModel new
		name: 'Reflectivity';
		prefixes: #('Reflectivity');
		yourself .
		
	ProjectModel new
		name: 'Regex';
		prefixes: #('Regex-');
		yourself .
		
	ProjectModel new
		name: 'Renraku';
		prefixes: #('Renraku');
		yourself .
		
	ProjectModel new
		name: 'Rubric';
		prefixes: #('Rubric');
		yourself .
		
	ProjectModel new
		name: 'STON';
		prefixes: #('STON-');
		yourself .
		
	ProjectModel new
		name: 'SUnit';
		prefixes: #('SUnit-');
		yourself .
		
	ProjectModel new
		name: 'Settings';
		prefixes: #('Settings-');
		yourself .
		
	ProjectModel new
		name: 'Shift';
		prefixes: #('Shift-');
		yourself .
		
	ProjectModel new
		name: 'Text';
		prefixes: #('Text-');
		yourself .
		
	ProjectModel new
		name: 'Tool';
		prefixes: #('Tool-');
		yourself .
		
	ProjectModel new
		name: 'UnifiedFFI';
		prefixes: #('UnifiedFFI');
		yourself .
		
	ProjectModel new
		name: 'Zinc';
		prefixes: #('Zinc-');
		yourself .
}.

DataCollector new
	collectDataFromCollectionOfProjects: projects
	andWriteToCsv: file.
```
