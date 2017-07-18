
!Bezier3Segment methodsFor: '*SVG-Morphic' stamp: 'gvc 7/30/2005 20:47'!
boundingBox
	"Return the bounds containing the receiver"

	|points quads rect|
	quads := OrderedCollection new.
	points := (Bezier3Segment convertBezier3ToBezier2: {start. via1. via2. end}) readStream.
	[points atEnd] whileFalse: [
		quads add: (Bezier2Segment from: points next via: points next to: points next)].
	rect := quads first boundingBox.
	quads do: [:q |
		rect := rect merge: q boundingBox].
	^rect! !
