

!DESNonPrimitive class methodsFor: 'class initialization' stamp: 'hmm 10/2/2006 21:39'!

initSBox: index from: anArray

	"Initialization data is given in the same order order as in the spec, which is nonsense.

	This method reorders it to avoid reordering in the encryption/decryption process."

	"Validity test:

	(DESNonPrimitive new applyToSBoxes: 2r011101000101110101000111101000011100101101011101)

	= 2r00110100111001011010010110101001"

	| row col |

	SBoxes at: index put: ((0 to: 63) collect: [:i |

		row := i // 32 * 2 + (i \\ 2).

		col := i // 2 \\ 16.

		anArray at: row * 16 + col + 1])! !

