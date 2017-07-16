
!ScratchScrollBar methodsFor: 'initialization' stamp: 'EMP 7/15/2017 15:45'!
initialize

	super initialize.
	target := nil.
	selector := nil.
	sliderStart := 0.
	sliderLength := 50.
	sliderInsets := 0@0 corner: 0@0.
	dragOffset := 0.
! !
