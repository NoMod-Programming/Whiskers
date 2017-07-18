
!KeyHolder methodsFor: 'initialize-release' stamp: 'RJT 5/2/2007 15:52'!
initialize
	self random: (SecureRandom picker nextBytesNonZero: 32)! !
