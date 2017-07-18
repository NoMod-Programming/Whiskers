
!MD5NonPrimitive methodsFor: 'private-buffers' stamp: 'ul 3/7/2008 16:50'!
finalHash
	"Concatenate the state values to produce the 128-bite result"
	
	^ (state at: 1) asByteArray, (state at: 2) asByteArray, (state at: 3) asByteArray, (state at: 4) asByteArray! !
