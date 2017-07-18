
!ProcedureHatBlockMorph class methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 14:45'!
fromSpec: specString params: paramCollection isAtomic: aBoolean
	| result |
	result _ self new.
	result params: paramCollection; spec: specString; isAtomic: aBoolean.
	^ result! !
