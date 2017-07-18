
!MD5WithPrimitive methodsFor: 'private-buffers' stamp: 'ul 3/7/2008 17:45'!
finalHash

	self primDecodeState: state.
	^state! !
