

!DESBitPermutation methodsFor: 'initialize-release' stamp: 'hmm 12/31/2001 18:23'!

map: srcBit to: dstBit

	| i mask array bit |

	i := srcBit // ChunkBits + 1.

	[tables size < i] whileTrue: [tables := tables copyWith: (Array new: ChunkMask+1 withAll: 0)].

	mask := 1 bitShift: (srcBit \\ ChunkBits).

	array := tables at: i.

	bit := 1 bitShift: dstBit.

	0 to: ChunkMask do: [:index |

		(index bitAnd: mask) = mask ifTrue: [

			array at: index+1 put: ((array at: index+1) bitOr: bit)]]! !

