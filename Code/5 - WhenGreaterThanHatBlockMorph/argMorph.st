
!WhenGreaterThanHatBlockMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 20:20'!
argMorph

	submorphs do: [:m |
		(m isKindOf: ReporterBlockMorph) ifTrue: [^ m]].
^ argMorph! !
