
!VariableArgMorph methodsFor: 'copying' stamp: 'EMP 11/5/2017 18:16'!
veryDeepFixupWith: deepCopier
	"If fields were weakly copied, fix them here.  If they were in the tree being copied, fix them up, otherwise point to the originals."

	super veryDeepFixupWith: deepCopier.
	morph := deepCopier references at: morph ifAbsent: [morph].! !
