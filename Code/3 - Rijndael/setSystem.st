
!Rijndael methodsFor: 'setup' stamp: 'cs 8/6/2002 17:56'!
setSystem
	self calculateNumberOfRounds.
	self calculateShiftOffsets.

	! !
