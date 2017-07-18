
!ScratchProcess methodsFor: 'private-stack' stamp: 'EMP 7/17/2017 16:15'!
isAtomic
	| presenter stopButton |
	presenter _ World findA: ScratchPresenterMorph.
	presenter notNil
		ifTrue: [stopButton _ presenter buttons third bounds]
		ifFalse: [stopButton _(World findA: ScratchFrameMorph) stopButton bounds].
	(Sensor anyButtonPressed and: [stopButton containsPoint: Sensor cursorPoint])
		ifTrue: 
			[self stop.
			ScratchFrameMorph allInstances do: [:t3 | t3 stopAll]].
	(Character value: 27)
		= Sensor peekKeyboardEvent
		ifTrue: 
			[Sensor flushKeyboard.
			Preferences noviceMode ifFalse: [Display flash: stopButton].
			^ false].
	((Time primMillisecondClock) > ci) ifTrue: [ci _ Time primMillisecondClock + 500. World displayWorldSafely].
	atomicityList ifNil: [^ false].
	atomicityList size = 0 ifTrue: [^ false].
	Sensor flushKeyboard.
	^ atomicityList last or: [BlockHighlightMSecs = 0]! !
