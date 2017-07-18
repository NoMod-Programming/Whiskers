
!MD5WithPrimitive methodsFor: 'initialization' stamp: 'ul 3/7/2008 17:47'!
initializeState

	state := ByteArray new: 16.
	self primInitializeState: state
! !
