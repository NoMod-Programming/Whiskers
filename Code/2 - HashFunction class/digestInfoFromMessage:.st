
!HashFunction class methodsFor: 'hashing' stamp: 'rww 9/21/2010 14:33'!
digestInfoFromMessage: msg

	^ (OrderedCollection 
		with: (OrderedCollection with: self oid with: nil)
		with: (self hashMessage: msg))
! !
