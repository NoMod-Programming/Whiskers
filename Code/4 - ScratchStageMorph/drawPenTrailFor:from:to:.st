
!ScratchStageMorph methodsFor: 'pen support' stamp: 'EMP 7/18/2017 12:38'!
drawPenTrailFor: aMorph from: oldPoint to: newPoint
	"Draw a pen trail between the given points for the given morph using its pen size and color. The points are in Scratch coordinates (that is, 0@0 is the center of the work pane and y increases toward the top of the screen."
	"The penTrailsForm is created on demand when the first pen is put down and removed (to save space) when pen trails are cleared."

	| pen penSize offset p1 p2 r |
	self createOrResizeTrailsForm.
	pen := Pen newOnForm: penTrailsForm.
	penSize := aMorph penSize.
	aMorph penSize ~= 1 ifTrue: [
		pen roundNib: penSize.
		pen sourceForm offset: nil].  "clear form offset"
	pen color: aMorph penColor.
	offset := (penTrailsForm extent - penSize) / 2.0.
	p1 := ((oldPoint * (1 @ -1)) + offset) rounded.
	p2 := ((newPoint * (1 @ -1)) + offset) rounded.
	pen drawFrom: p1 to: p2.
	r := ((p1 rect: p2) expandBy: penSize + 1) translateBy: self topLeft.
	self invalidRect: r.
! !
