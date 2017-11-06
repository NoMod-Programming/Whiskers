
!LibraryItemMorph methodsFor: 'event handling' stamp: 'EMP 11/3/2017 20:40'!
mouseLeaveDragging: evt

	"(evt hand submorphs at: 1) removeCopyTooltip."

	isSelected ifTrue: [^ self].

	rolloverOn := false.
	self changed.
! !
