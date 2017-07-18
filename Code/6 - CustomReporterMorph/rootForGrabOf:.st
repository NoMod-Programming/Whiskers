
!CustomReporterMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:39'!
rootForGrabOf: aMorph 
	(self owner isKindOf: CustomProcedureHolder) ifTrue: [^ self fullCopy].
	^ self! !
