
!ScratchStageMorph methodsFor: 'clones' stamp: 'EMP 7/18/2017 15:44'!
deleteAllClones
	"Delete all clones."

	self allClones do: [:clone | clone delete].
	cloneCount := 0.! !
