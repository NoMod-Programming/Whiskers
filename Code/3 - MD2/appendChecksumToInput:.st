
!MD2 methodsFor: 'accessing' stamp: 'rww 1/23/2007 19:58'!
appendChecksumToInput: input

	| checksum l c |
	checksum := ByteArray new: 16 withAll: 0.
	l := 0.

	0 to: (input size // 16) - 1 do: [:i |
		1 to: 16 do: [:j |
			c := input at: (i * 16 + j).
			checksum at: j put: ((checksum at: j) bitXor: (self piTable at: (c bitXor: l) + 1)).
			l := checksum at: j]].

	^ input, checksum
! !
