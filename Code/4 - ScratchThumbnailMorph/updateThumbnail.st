
!ScratchThumbnailMorph methodsFor: 'stepping' stamp: 'EMP 7/13/2017 13:57'!
updateThumbnail

	| f e r |
	image fillColor: Color transparent.
	target ifNil: [^ self].

	f := target costume form.

	((f width <= image width) & (f height <= image height)) ifTrue: [
		"target's image fits without shrinking"
		f displayOn: image at: ((image extent - f extent) // 2).
		^ self changed].

	f width > f height 
		ifTrue: [e := image width @ ((f height * image width) // f width)]
		ifFalse: [e := ((f width * image height) // f height) @ image height].
	e := e max: (8@8).
	r := Rectangle center: (image extent // 2) extent: e.

	(WarpBlt toForm: image)
		sourceForm: f;
		cellSize: 2;  "do smoothing; this also installs a colormap"
		combinationRule: Form paint;
		copyQuad: f boundingBox innerCorners toRect: (r insetBy: 2).

	lastUpdateMSecs := target costumeChangeMSecs.
	self changed.
! !
