
!CustomProcedureHolder methodsFor: 'accessing' stamp: 'EMP 7/17/2017 09:53'!
fixParameters
	| i |
	i _ 0.
	(self submorphs select: [:submorph | submorph isKindOf: CustomReporterMorph])
		 do: [:param |
			i _ i + 1.
			param commandSpec: (paramNames at: i ifAbsent: ['undefined']); selector: (paramNames at: i ifAbsent: ['undefined'])]! !
