

!Rijndael methodsFor: 'block cipher' stamp: 'len 8/21/2002 16:17'!

eqFinalRound: roundNumber

	| a1 a2 a3 a4 newState start |

	newState := Array new: nB.



	"do SubBytesInverse and ShiftRowsInverse in one step"

	0 to: nB-1 do: [:j |

		a1 := SubByteInverse at: ((state at: j + 1) byteAt: 1) + 1.

		a2 := SubByteInverse at: ((state at: (j - shiftOffset1) \\ nB + 1) byteAt: 2) + 1.

		a3 := SubByteInverse at: ((state at: (j - shiftOffset2) \\ nB + 1) byteAt: 3) + 1.

		a4 := SubByteInverse at: ((state at: (j - shiftOffset3) \\ nB + 1) byteAt: 4) + 1.

		newState at: j+1 put: 

			(ThirtyTwoBitRegister byte1: a1 byte2: a2 byte3: a3 byte4: a4)].



	"add equivalent round key"

	start := roundNumber * nB.

	1 to: nB do: [:k | 

		state at: k put: ((newState at: k) bitXor: (eqExpandedKey at: start + k))]! !

