
!SVGMorph methodsFor: 'accessing' stamp: 'gvc 7/30/2005 22:19'!
drawSubmorphsOn: aCanvas 
	"Display the receiver."
	
	|balloonCanvas|
	balloonCanvas := aCanvas asBalloonCanvas.
	super drawSubmorphsOn: balloonCanvas! !
