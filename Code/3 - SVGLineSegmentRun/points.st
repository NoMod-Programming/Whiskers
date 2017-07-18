
!SVGLineSegmentRun methodsFor: 'as yet unclassified' stamp: 'gvc 10/25/2005 13:23'!
points
	"Answer the collection of points that are formed by the segments.."

	|answer|
	answer := OrderedCollection new: self segments size * 2.
	self segments do: [:s |
		answer
			add: s start;
			add: s end].
	^answer asArray! !
