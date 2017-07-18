
!WatcherMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 23:34'!
writeJSON: aDictionary images: images sounds: sounds
	| hasSlider stage |
	aDictionary at: 'target' put: (readout target objName).
	aDictionary at: 'cmd' put: (readout getSelector).
	aDictionary at: 'param' put: (readout parameter).
	aDictionary at: 'color' put: ('TODO COLOR').
	aDictionary at: 'label' put: titleMorph contents.
	hasSlider := self isVariableWatcher and: [scratchSlider notNil].
	aDictionary at: 'mode' put: 1.

	hasSlider not & isLarge
		ifTrue: [aDictionary at: 'mode' put: 2].

	self isVariableWatcher ifTrue: [
		scratchSlider
			ifNotNil: [
				aDictionary at: 'mode' put: 3]].

	aDictionary at: 'sliderMin' put: sliderMin.
	aDictionary at: 'sliderMax' put: sliderMax.

	aDictionary at: 'isDiscrete' put: false.
	stage := (self ownerThatIsA: ScratchStageMorph).
	aDictionary at: 'x' put: self left + 240.
	aDictionary at: 'y' put: self top + 180.

	aDictionary at: 'visible' put: true.! !
