
!VariableArgMorph methodsFor: 'object i/o' stamp: 'EMP 11/5/2017 18:16'!
storeFieldsOn: anObjStream

	super storeFieldsOn: anObjStream.
	self storeFieldsNamed: #(
		morph
	) on: anObjStream.
! !
