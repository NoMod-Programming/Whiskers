
!WhenClonedEventHatMorph methodsFor: 'other' stamp: 'EMP 7/17/2017 17:03'!
printHatNameOn: aStream
	"Append a human-readable string for this hat block's name to the given stream."

	aStream nextPutAll: 'when ', self receiverName, ' cloned'; cr.
! !
