
!MD5NonPrimitive methodsFor: 'private-buffers' stamp: 'len 10/15/2002 19:58'!
finalValue
	"Concatenate the state values to produce the 128-bite result"
	^ (state at: 1) asByteArray, (state at: 2) asByteArray, (state at: 3) asByteArray, (state at: 4) asByteArray! !
