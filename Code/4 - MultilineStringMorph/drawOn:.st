
!MultilineStringMorph methodsFor: 'drawing' stamp: 'EMP 11/5/2017 16:19'!
drawOn: aCanvas

	| clipC |
	super drawOn: aCanvas.
	lineHeight ifNil: [self font: font].

	clipC := aCanvas
		copyOffset: bounds origin
		clipRect: (bounds insetBy: borderWidth).

	(hasFocus | owner isNil) ifTrue: [self drawSelectionOn: clipC].
	self drawTextOn: clipC.
! !
