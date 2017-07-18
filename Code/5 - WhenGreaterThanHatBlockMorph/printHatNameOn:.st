
!WhenGreaterThanHatBlockMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 20:17'!
printHatNameOn: aStream
	"Append a human-readable string for this hat block's name to the given stream."

	aStream nextPutAll: 'when '.
	self printCodeSubmorph: argMorph on: aStream.
	aStream nextPutAll: ' becomes true'; cr.
! !
