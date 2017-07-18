
!KeyHolder methodsFor: 'initialize-release' stamp: 'RJT 2/9/2007 11:01'!
destroy
	self randomChangeProcess terminate.
	self randomChangeProcess: nil.
	self random destroy.
	self data key destroy.
	self data: nil.! !
