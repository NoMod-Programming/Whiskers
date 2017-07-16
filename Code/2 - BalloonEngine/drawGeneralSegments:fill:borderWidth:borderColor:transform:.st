
!BalloonEngine methodsFor: '*SVG-Morphic' stamp: 'gvc 10/3/2005 11:01'!
drawGeneralSegments: segments fill: fillStyle borderWidth: borderWidth borderColor: borderFill transform: aTransform
	"Draw the given segments."

	| fills |
	self edgeTransform: aTransform.
	self resetIfNeeded.
	fills := self registerFill: fillStyle and: borderFill.
	segments do:[:segment|
		segment primAddToEngine: self
			fills: fills
			lineWidth: borderWidth.
		"Note: To avoid premature flushing of the pipeline we need to
		reset the flush bit within the engine."
		self primFlushNeeded: false.
	].
	"And set the flush bit afterwards"
	self primFlushNeeded: true.
	self postFlushIfNeeded.! !
