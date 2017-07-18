
!SecureRandom class methodsFor: 'class initialization' stamp: 'cmm 2/15/2006 23:26'!
initialize
	super initialize.
	Smalltalk 
		addToStartUpList: self ;
		addToShutDownList: self.
	self startUp! !
