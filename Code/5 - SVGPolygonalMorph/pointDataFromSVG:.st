
!SVGPolygonalMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/3/2005 12:16'!
pointDataFromSVG: anElement
	"Answer a collection of points from the polygon data."
	
	|pts str x y|
	pts := OrderedCollection new.
	str := (anElement attributeAt: 'points') readStream.
	[str atEnd] whileFalse: [
		x _ str nextNumber.
		y _ str nextNumber.
		(x notNil and: [y notNil])
			ifTrue: [pts add: x@y]].
	^pts! !
