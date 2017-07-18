
!RandomGenerator class methodsFor: 'initialize-release' stamp: 'cmm 12/16/2006 10:14'!
initialize
	super initialize.
	Smalltalk
		addToStartUpList: self ;
		addToShutDownList: self.
	self startUp! !
