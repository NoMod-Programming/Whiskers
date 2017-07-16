
!ScratchPresenterMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 13:45'!
drawOn: aCanvas

	| stageRect |
	stageRect := Rectangle
		center: stageWrapper center
		extent: stageWrapper extent -2.

	(self bounds areasOutside: stageRect) do: [:r |
		aCanvas fillRectangle: r color: color].
	aCanvas frameRectangle: (stageRect expandBy: 2) width: 2 color: ScratchFrameMorph borderColor.

	(aCanvas clipRect intersects: stageRect) ifTrue: [
		offscreenWorld invalidRect: aCanvas clipRect.
		offscreenWorld incrRedraw].
! !
