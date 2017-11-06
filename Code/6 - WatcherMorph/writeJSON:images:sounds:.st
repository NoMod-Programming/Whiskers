
!WatcherMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 19:39'!
writeJSON: aDictionary images: images sounds: sounds
	| hasSlider stage |
	aDictionary at: 'target' put: (readout target objName).
	aDictionary at: 'cmd' put: (readout getSelector).
	aDictionary at: 'param' put: (readout parameter isScratchVariable ifTrue: [readout parameter varName] ifFalse: [readout parameter]).
	aDictionary at: 'color' put: (Number readFrom: readoutFrame color printHtmlString base: 16).
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
