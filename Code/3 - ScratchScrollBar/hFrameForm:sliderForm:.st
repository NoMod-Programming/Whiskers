
!ScratchScrollBar methodsFor: 'initialization' stamp: 'EMP 7/15/2017 15:45'!
hFrameForm: frameForm sliderForm: sliderForm
	"Initialize myself as a horizontal slider, setting my forms by cutting up the given forms.
	We magnify the frameMiddleForm by 100 to make a decent sized form that will require less bitBlt calls"

	| midX h |
	"set my forms"
	midX := frameForm height // 2.
	h := frameForm height.
	frameStartForm := frameForm copy: (0@0 extent: midX@h).
	frameMiddleForm := frameForm copy: (midX@0 extent: 1@h).
	frameMiddleForm := frameMiddleForm magnify: frameMiddleForm boundingBox by: 100@1.
	frameEndForm := frameForm copy: ((midX + 1)@0 corner: frameForm extent).

	h := sliderForm height.
	sliderStartForm := sliderForm copy: (0@0 extent: 7@h).
	sliderMiddleForm := sliderForm copy: (7@0 extent: 1@h).
	sliderEndForm := sliderForm copy: (8@0 corner: sliderForm extent).

	sliderInsets := 0@0 corner: 0@0.
	self extent: 200 @ frameStartForm height.
! !
