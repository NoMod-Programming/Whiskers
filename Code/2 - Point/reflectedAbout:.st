
!Point methodsFor: '*SVG-Morphic' stamp: 'gvc 8/4/2005 10:21'!
reflectedAbout: aPoint
	"Answer a new point that is the reflection of the receiver about the given point."

	^(self - aPoint) negated + aPoint! !
