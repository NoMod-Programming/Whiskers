
!SVGPathMorph methodsFor: 'accessing' stamp: 'gvc 7/30/2005 20:47'!
userSpaceBoundingBoxWithRespectTo: aComposite
	"Answer the bounding box of the receiver with respect to the transforms
	intervening between the receiver and aComposite."

	|rect subRect trans|
	self segments isEmpty
		ifTrue: [^nil].
	trans := self transformFrom: aComposite.				
	rect := self segments first boundingBox boundsWithTransform: trans.
	self segments do: [:s |
		subRect := s boundingBox.
		subRect notNil
			ifTrue: [subRect := subRect boundsWithTransform: trans.
					rect := rect merge: subRect]].
	^rect! !
