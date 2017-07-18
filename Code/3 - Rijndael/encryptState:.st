
!Rijndael methodsFor: 'block cipher' stamp: 'len 8/8/2002 18:08'!
encryptState: aState 
	state := aState.
	self addRoundKey: 0.
	1 to: nR - 1 do: [:roundNumber | self round: roundNumber].
	self finalRound: nR.
	^ state! !
