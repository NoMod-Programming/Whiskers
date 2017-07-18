
!SmalltalkImageInstanceID class methodsFor: 'class initialization' stamp: 'RJT 8/23/2006 00:16'!
initialize
	super initialize.
	Smalltalk 
		addToStartUpList: self ;
		addToShutDownList: self.
	self startUp! !
