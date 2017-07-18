
!Rijndael methodsFor: 'block cipher' stamp: 'cs 8/6/2002 21:14'!
addRoundKey: roundNumber 
	| start |
	start := roundNumber * nB.
	1 to: nB do: [:k | 
		(state at: k) bitXor: (expandedKey at: start + k)]! !
