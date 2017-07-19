

!Rijndael methodsFor: 'block cipher' stamp: 'len 8/8/2002 18:08'!

decryptState: aState 

	state := aState.

	self addEqRoundKey: nR.

	nR - 1 to: 1 by: -1 do: [:roundNumber | self eqRound: roundNumber].

	self eqFinalRound: 0.

	^ state! !

