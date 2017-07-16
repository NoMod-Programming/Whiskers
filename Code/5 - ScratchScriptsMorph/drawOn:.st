
!ScratchScriptsMorph methodsFor: 'drawing' stamp: 'EMP 7/14/2017 14:10'!
drawOn: aCanvas
	"Fill with my texture patch. Fill with a solid color if there is no texture in the current skin dictionary."


	self isScreenshooting ifTrue: [
		aCanvas fillRectangle: self bounds color: Color transparent.
		^ self].
	
	aCanvas frameAndFillRectangle: (self bounds) fillColor: color borderWidth: 1 borderColor: ScratchFrameMorph borderColor.
! !
