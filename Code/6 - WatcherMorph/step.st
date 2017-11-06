
!WatcherMorph methodsFor: 'stepping' stamp: 'EMP 11/5/2017 19:34'!
step
	self updateTargetName.
	scratchSlider
		ifNotNil: [(scratchSlider hasMouseFocus)
				ifFalse: 
					[scratchSlider width: self width - 12.
					scratchSlider updateSliderPosition]].! !
