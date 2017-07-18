
!WatcherMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 14:23'!
readJSON: aDictionary spritesByName: spritesByName
	| sliderRange |
	self
		target: (spritesByName
				at: (aDictionary at: 'target'))
		selector: (aDictionary at: 'cmd')
		parameter: (aDictionary at: 'param');
		
		setCategoryColor: (Color fromString: '#'
					, ((aDictionary at: 'color')
							printStringRadix: 16)).
	(aDictionary at: 'mode')
			= 2
		ifTrue: [self layoutStyle: #large].
	(aDictionary at: 'mode')
			= 3
		ifTrue: [self layoutStyle: #slider].
	sliderRange := Array new: 2.
	sliderRange
		at: 1
		put: (aDictionary at: 'sliderMin').
	sliderRange
		at: 2
		put: (aDictionary at: 'sliderMax').
	self sliderRange: sliderRange;
		 position: (aDictionary at: 'x')
@ (aDictionary at: 'y')! !
