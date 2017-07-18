
!DESBitPermutation class methodsFor: 'class initialization' stamp: 'hmm 12/31/2001 15:52'!
initialize
	"DESBitPermutation initialize"
	ChunkBits := 6.
	ChunkMask := (1 bitShift: ChunkBits) - 1! !
