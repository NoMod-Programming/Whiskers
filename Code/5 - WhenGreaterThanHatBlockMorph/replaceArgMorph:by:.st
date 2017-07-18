
!WhenGreaterThanHatBlockMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 20:17'!
replaceArgMorph: oldMorph by: newMorph
	"Replace oldMorph with newMorph. This is done when dropping a reporter block onto my argument."

	argMorph := newMorph.
	self replaceSubmorph: oldMorph by: newMorph.
	self layoutChanged.
! !
