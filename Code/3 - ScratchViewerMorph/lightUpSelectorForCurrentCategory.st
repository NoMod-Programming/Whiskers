
!ScratchViewerMorph methodsFor: 'private' stamp: 'EMP 7/13/2017 15:50'!
lightUpSelectorForCurrentCategory

	categoryButtons do: [:m |
			m label = currentCategory
				ifTrue: [m isSelected: true]
				ifFalse: [m isSelected: false]].
! !
