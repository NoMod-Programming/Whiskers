
!DESBitPermutation methodsFor: 'permuting' stamp: 'hmm 12/31/2001 15:51'!
permute: input
	| output shift bits |
	output := 0.
	shift := 0.
	tables do: [:array |
		bits := (input bitShift: shift) bitAnd: ChunkMask.
		output := output + (array at: bits+1).
		shift := shift - ChunkBits].
	^output! !
