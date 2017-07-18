
!WhenGreaterThanHatBlockMorph methodsFor: 'copying' stamp: 'EMP 7/16/2017 20:17'!
veryDeepFixupWith: deepCopier
	"If fields were weakly copied, fix them here.  If they were in the tree being copied, fix them up, otherwise point to the originals."

	super veryDeepFixupWith: deepCopier.
	argMorph := deepCopier references at: argMorph ifAbsent: [argMorph]
! !
