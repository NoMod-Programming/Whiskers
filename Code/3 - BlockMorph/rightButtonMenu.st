
!BlockMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 16:12'!
rightButtonMenu

	| menu |
	menu  :=  ScratchMenuMorph new defaultTarget: self; itemHeight: 22; color: color.
	
	menu add: 'help' localized action: #presentHelpScreen.

	(owner isKindOf: ScratchBlockPaletteMorph) ifFalse: [
		menu addLine.
		menu add: 'duplicate' localized  action: #duplicate.	
		(self owner isBlockMorph) ifFalse: [  "we can't yet delete a blocks inside a script"
			menu add: 'delete' localized  action: #delete]].

	DebugMenu ifTrue: [
		menu addLine.
		menu add: 'show tuples' localized action: #showTuples].
	
	menu popUpInWorld
! !
