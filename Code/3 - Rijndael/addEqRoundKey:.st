

!Rijndael methodsFor: 'block cipher' stamp: 'cs 8/8/2002 17:07'!

addEqRoundKey: roundNumber 

	| start |

	start := roundNumber * nB.

	1 to: nB do: [:k | 

		(state at: k) bitXor: (eqExpandedKey at: start + k)]! !

