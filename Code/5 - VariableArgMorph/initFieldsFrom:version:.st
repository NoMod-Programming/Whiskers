
!VariableArgMorph methodsFor: 'object i/o' stamp: 'EMP 11/5/2017 18:16'!
initFieldsFrom: anObjStream version: classVersion

	super initFieldsFrom: anObjStream version: classVersion.
	self initFieldsNamed: #(
		morph
	) from: anObjStream.
! !
