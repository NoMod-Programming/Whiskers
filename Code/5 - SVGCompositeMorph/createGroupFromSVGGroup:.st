
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 14:41'!
createGroupFromSVGGroup: anElement
	"Create a group from the svg group."

	^self create: SVGGroupMorph fromSVG: anElement! !
