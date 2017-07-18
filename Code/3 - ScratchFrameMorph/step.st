
!ScratchFrameMorph methodsFor: 'stepping' stamp: 'EMP 7/16/2017 20:32'!
step
	"Run each process until it gives up control, then filter out any processes that have terminated."

	| screenExtent oldJustSaved |
	fillScreenFlag ifTrue: [
		screenExtent := Display extent.
		((self position = (0@0)) and: [self extent = screenExtent]) ifFalse: [
			oldJustSaved := justSaved.
			self position: 0@0.
			self extent: screenExtent.
			self enterQuarterModeIfSmallScreen.
			scriptsPane currentCategory: scriptsPane currentCategory.
			justSaved := oldJustSaved.
			^ self]].

	workPane ifNotNil: [
		viewerPane target isNil 
			ifTrue: [workPane viewBlocksAndScripts]
			ifFalse: [viewerPane target isInWorld ifFalse: [workPane viewBlocksAndScripts]]].

	paintingInProgress ifTrue: [^ self].

	workPane stepServers.
	self checkForWeDo.
	self updateToolButtons.

	self processWhenConditions.
	workPane stepProcesses.
	workPane stepServers.

	workPane processesToRun size > 0
		ifTrue: [flagButton on]
		ifFalse: [flagButton off].
! !
