
!ScratchFrameMorph methodsFor: 'tools (no longer used)' stamp: 'EMP 7/14/2017 15:04'!
undoTool
"so far seems to not be used"
	| m newOwner oldName |
	self paintingInProgress ifTrue: [^ Beeper beep].
	ScratchClipboard ifNil: [^ Beeper beep].
	self activeHand cancelScratchToolType.
	m := ScratchClipboard fullCopy.
	"Reset clipboard to empty since an undo just happened"
	
	(m isBlockMorph) ifTrue: [
		newOwner := viewerPane target.
		newOwner ifNotNil: [m newScriptOwner: newOwner].
		(viewerPane currentCategory = 'Data') ifTrue: [
			"update 'variables' category if it is showing"
			viewerPane currentCategory: 'Data']].

	(m isScratchSpriteMorph) ifTrue: [  "sprite; add to stage"
		m filterReset; show.
		m objName: ScratchClipboard objName.
		ScratchClipboard := nil.
		oldName := m objName.
		self addAndView: m.
		m objName: oldName.
		^ self].

	"blocks or anything else: attach to hand"
	self activeHand attachMorph: m.
	ScratchClipboard := nil.
! !
