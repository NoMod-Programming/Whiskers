
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/16/2017 10:55'!
drawSubmorphsOn: aCanvas 
	"Display the receiver."
	
	(self composedStyle at: 'display')
		ifFalse: [^self].
	aCanvas asBalloonCanvas preserveStateDuring:[:balloonCanvas|
		balloonCanvas
			aaLevel: 3.
		super drawSubmorphsOn: balloonCanvas]! !
