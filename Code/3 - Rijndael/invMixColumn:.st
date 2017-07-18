
!Rijndael methodsFor: 'key schedule' stamp: 'len 8/15/2002 01:35'!
invMixColumn: aColumn
	| a0 a1 a2 a3 result |
	a0 := SubByte at: (aColumn byteAt: 1) + 1.
	a1 := SubByte at: (aColumn byteAt: 2) + 1.
	a2 := SubByte at: (aColumn byteAt: 3) + 1.
	a3 := SubByte at: (aColumn byteAt: 4) + 1.
	result := (InvT0 at: a0+1) copy.
	result bitXor: (InvT1 at: a1+1).
	result bitXor: (InvT2 at: a2+1).
	result bitXor: (InvT3 at: a3+1).
	^ result	! !
