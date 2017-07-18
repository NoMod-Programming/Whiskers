
!WhenGreaterThanHatBlockMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 20:21'!
argMorphToReplace: aMorph
	"Answer a new argument morph to be used to replace the given morph."

	aMorph ~= argMorph ifTrue: [^ nil].
^ (ExpressionArgMorph new)! !
