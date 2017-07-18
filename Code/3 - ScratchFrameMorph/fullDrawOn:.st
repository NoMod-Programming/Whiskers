
!ScratchFrameMorph methodsFor: 'drawing' stamp: 'EMP 7/17/2017 22:48'!
fullDrawOn: aCanvas
	"Draw my full Morphic structure on the given Canvas."
	"Optimization: if damage is entirely contained in a given pane, draw only that pane."

	| damageR stageR |
	damageR := aCanvas clipRect.

	workPaneWrapper ifNil: [^ self].

	stageR := workPaneWrapper bounds.
	(stageR containsRect: damageR) ifTrue: [
		workPaneWrapper fullDrawOn: aCanvas.
		^ self].

	(scriptsPane bounds containsRect: damageR) ifTrue: [
		scriptsPane fullDrawOn: aCanvas.
		^ self].

	(viewerPane bounds containsRect: damageR) ifTrue: [
		viewerPane fullDrawOn: aCanvas.
		^ self].

	(readoutPane bounds containsRect: damageR) ifTrue: [
		readoutPane fullDrawOn: aCanvas.
		^ self].

	(libraryPane bounds containsRect: damageR) ifTrue: [
		libraryPane fullDrawOn: aCanvas.
		readoutPane fullDrawOn: aCanvas.
		^ self].

	(topPane bounds containsRect: damageR) ifTrue: [
		topPane fullDrawOn: aCanvas.
		^ self].

	super fullDrawOn: aCanvas.
! !
