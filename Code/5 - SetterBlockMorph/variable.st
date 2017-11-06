
!SetterBlockMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 18:53'!
variable

	submorphs do: [:m |
		(m isVariableArgMorph) ifTrue: [^ m evaluate]].
	^ ''

! !
