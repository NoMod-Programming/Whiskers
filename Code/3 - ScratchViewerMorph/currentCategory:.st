
!ScratchViewerMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 21:22'!
currentCategory: aString

	World activeHand newKeyboardFocus: nil.
	currentCategory = aString ifTrue: [^ self refresh].
	currentCategory := aString.
	self lightUpSelectorForCurrentCategory.
	self updateContents.
! !
