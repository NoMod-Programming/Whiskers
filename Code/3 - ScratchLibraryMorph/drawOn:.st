
!ScratchLibraryMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 13:45'!
drawOn: aCanvas
	"Draw my background."

	"Top bar"
	aCanvas fillRectangle: (bounds topLeft extent: (bounds width @ (topSectionHeight + 18))) color: Color white.
	TitleStyle origin: bounds topLeft + (2@18).
	TitleStyle direction: 0@topSectionHeight.
	aCanvas frameAndFillRoundRect: ((bounds topLeft + (2@18)) extent: (bounds width - 11) @ (topSectionHeight)) radius: self cornerRadius fillStyle: TitleStyle borderWidth: 1 borderColor:  ScratchFrameMorph borderColor.
	"Bottom half + Horizontal Line"
	aCanvas fillRectangle: ((bounds left@(bounds top + topSectionHeight + 18)) extent: (bounds width@(bounds height - topSectionHeight - 18))) color: Color white.
	aCanvas frameAndFillRectangle: ((bounds left + 2@(bounds top + topSectionHeight + 13)) extent: (bounds width - 11@(bounds height - topSectionHeight - 14))) fillColor: ScratchFrameMorph palettePaneColor borderWidth: 1 borderColor: ScratchFrameMorph borderColor.
	"Vertical Line"
	aCanvas line: (stagePane right)@(bounds top + 18) to: (stagePane right)@(bounds bottom - 4) width: 1 color: ScratchFrameMorph borderColor.! !
