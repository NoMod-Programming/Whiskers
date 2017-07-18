
!SHA256WithPrimitive methodsFor: 'private' stamp: 'ul 3/6/2008 22:40'!
finalHash

	| hash |
	hash := ByteArray new: state size.
	self primFinalHash: hash fromState: state.
	^hash! !
