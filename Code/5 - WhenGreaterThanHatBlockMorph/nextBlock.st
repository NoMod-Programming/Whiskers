
!WhenGreaterThanHatBlockMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 20:17'!
nextBlock
	"Answer the block following myself in the block sequence or nil if I am the last block in the sequence. Each block is a submorph of the previous block."

	^ self submorphs
		detect: [:m | (m isBlockMorph) and: [m ~= argMorph]]
		ifNone: [nil]
! !
