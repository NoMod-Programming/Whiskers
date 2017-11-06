
!WatcherMorph methodsFor: 'accessing' stamp: 'EMP 11/5/2017 20:18'!
convertFromOldWatcher
	"Convert myself from old watcher structure to the current structure."

	| o p target selector param wasLarge showSlider oldRange c |
	o := self owner.
	p := self position.
	target := readout target.
	selector := readout getSelector.
	(selector = #getUserVar:) ifTrue: [selector := #getVar:].  "update selector"
	param := readout parameter.
	wasLarge := readoutFrame isLarge.
	showSlider := scratchSlider notNil.
	oldRange := self sliderRange.

	self delete; removeAllMorphs; initialize.
	self
		position: p;
		target: target selector: selector parameter: param;
		sliderRange: oldRange.
	"readoutFrame layoutChanged." "hopefully temp fix until layout policy stuff sorted"
	self layoutForViewer.

	selector = #getVar:
		ifTrue: [self setCategoryColor: target variableBlockColor]
		ifFalse: [
			c := ScriptableScratchMorph blockColorDict at: selector ifAbsent: [nil].
			c ifNotNil: [self setCategoryColor: c]].

	o addMorph: self.
	self updateTargetName.
	wasLarge ifTrue: [self showLargeReadout].
	showSlider ifTrue: [self showSlider].
! !
