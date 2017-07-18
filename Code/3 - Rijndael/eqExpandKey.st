
!Rijndael methodsFor: 'key schedule' stamp: 'cs 8/8/2002 17:37'!
eqExpandKey
	eqExpandedKey := Array new:  nB * (nR + 1).

	1 to: nB do: [:j |
		eqExpandedKey at: 0*nB + j put: (expandedKey at: 0*nB + j).
		eqExpandedKey at: nR*nB + j put: (expandedKey at: nR*nB + j).
		].
	1 to: nR-1 do: [:i |
		1 to: nB do: [:j |
			eqExpandedKey at: i*nB + j put: 
				(self invMixColumn: (expandedKey at: i*nB + j))
			]
		].
	
! !
