
!SHA256WithPrimitive methodsFor: 'private' stamp: 'ul 3/6/2008 22:40'!
initialize

	state := ByteArray new: 32.
	self primInitializeState: state! !
