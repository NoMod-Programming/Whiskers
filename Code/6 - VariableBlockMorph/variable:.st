
!VariableBlockMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 18:45'!
variable: aSpriteMorph
	(aSpriteMorph isString) ifTrue: [
		varReference := receiver getVarReference: aSpriteMorph.
		^ self
	].
	varReference := aSpriteMorph.
! !
