
!WhenGreaterThanHatBlockMorph methodsFor: 'dropping/grabbing' stamp: 'EMP 7/16/2017 20:17'!
reporterDropAcceptingArgAt: aRect 
	"return an arg morph that accepts reporter morph drops and that intersect aRect. Part of finding the top argMorph when dropping into a Scratch scripts morph"
"Note that WhenHats seem not to be used"
	| argM |
	argM := self argMorph.
	((argM bounds intersects: aRect) and:
	 [argM acceptsDroppedReporters])
		ifTrue: [^ argM]
! !
