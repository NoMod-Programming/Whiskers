
!ScratchTabPaneMorph methodsFor: 'initialization' stamp: 'EMP 7/14/2017 16:07'!
initialize

	super initialize.
	"make sure we can't drop any morphs on me"
	self dropEnabled: false.
	self color: Color red.
	self extent: 100@28.! !
