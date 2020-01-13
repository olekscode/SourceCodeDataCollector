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
dir := '/Users/oleks/Documents/Research/2019-sourcecodedata' asFileReference.
```
```Smalltalk
dataCollector := InternalDataCollector withWorkingDirectory: dir.
dataCollector start.
```
```Smalltalk
dataCollector := ExternalDataCollector withWorkingDirectory: dir.
dataCollector start.
```
