
!ScratchViewerMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 15:26'!
drawOn: aCanvas
	"Draw my background."

	color isTransparent ifTrue: [^ self].

	aCanvas
		fillRectangle: (self topLeft extent: (self width @ self catButtonsExtent y))
		color: color.

	aCanvas line: (bounds left + 8@(topSectionHeight + bounds top)) to: (bounds right - 20@(bounds top + topSectionHeight)) width: 1 color: ScratchFrameMorph borderColor.
	aCanvas line: (bounds left + 8@(topSectionHeight + bounds top + 1)) to: (bounds right - 20@(bounds top + topSectionHeight + 1)) width: 1 color: (Color r: 242 g: 242 b: 242 range: 255).! !
