
!ProcedureHatBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 09:46'!
params: aCollection
	parameterNames := aCollection.
	block ifNotNil: [
	(block submorphs) size > 0 ifTrue: [block submorphs first parameterNames: aCollection]]! !
