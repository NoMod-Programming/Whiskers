
!ScratchCommentMorph methodsFor: 'event handling' stamp: 'EMP 11/5/2017 16:14'!
rightButtonMenu

	| menu |
	menu := ScratchMenuMorph new defaultTarget: self.

	menu addLine.
	menu add: 'delete' localized action: #delete.
	menu add: 'duplicate' localized action: #duplicate.

	menu popUpInWorld
! !
