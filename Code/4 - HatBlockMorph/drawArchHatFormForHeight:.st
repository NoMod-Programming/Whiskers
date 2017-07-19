
!HatBlockMorph methodsFor: 'drawing' stamp: 'EMP 7/18/2017 15:29'!
drawArchHatFormForHeight: height
"draw an Arch/Hat Form with plenty of spare width to cache. Unlike the cached forms for BlockMorphs in general we can't use a 2bpp Form and a color map since the arch form is read from an image on disk; we have no idea what colors it uses"
	| aCanvas archForm stretchX leftForm midForm rightForm x archBottom width |
	archForm := self hatTopForm.
	aCanvas := FormCanvas extent:(archForm width + 100)@height depth: 2.

	width := aCanvas extent x.
	stretchX := archForm width - 22.
	leftForm := archForm copy: (0@0 corner: stretchX@archForm height).
	midForm := archForm copy: (stretchX@0 extent: 1@archForm height).
	rightForm := archForm copy: ((stretchX + 1)@0 corner: archForm extent).
	x := 0.
	aCanvas paintImage: leftForm at: x@0.
	x := x + leftForm width.
	(width - (leftForm width + rightForm width)) asInteger timesRepeat: [
		aCanvas paintImage: midForm at: x@0.
		x := x + 1].
	aCanvas paintImage: rightForm at: x@0.

	archBottom := archForm height.
	aCanvas
		fillRectangle: (2@archBottom corner: (width - 1)@(height - self tabBottomHeight)) 
		color: color.
	aCanvas
		fillRectangle: (0@archBottom corner: 2@(height - self tabBottomHeight))
		color: highlightColor2.

	aCanvas
		fillRectangle: ((width - 1)@(archBottom -  1) corner: self right@(height - self tabBottomHeight))
		color: shadowColor.

	self drawBottomEdgeOn: aCanvas width:width height: height baseColor: color light: highlightColor1 dark: shadowColor.
	^aCanvas form

! !
