
!VariableArgMorph methodsFor: 'other' stamp: 'EMP 11/5/2017 18:31'!
defaultValue: aSpriteMorph

	(aSpriteMorph isString) ifTrue: [
		morph := owner receiver getVarReference: aSpriteMorph.
		^ self
	].
	morph := aSpriteMorph.
! !
