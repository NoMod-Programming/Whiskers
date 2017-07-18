
!Rectangle methodsFor: '*SVG-Morphic' stamp: 'gvc 7/30/2005 20:48'!
boundsWithTransform: aTransform
	"Apply the transform to the corners and answer a new
	rectangle enclosing the virtual rectangle produced."

	|tl tr br bl|
	tl := aTransform transformPoint: self topLeft.
	tr := aTransform transformPoint: self topRight.
	br := aTransform transformPoint: self bottomRight.
	bl := aTransform transformPoint: self bottomLeft.
	^(((tl x min: tr x) min: br x) min: bl x)@(((tl y min: tr y) min: br y) min: bl y)
		corner: (((tl x max: tr x) max: br x) max: bl x)@(((tl y max: tr y) max: br y) max: bl y)! !
