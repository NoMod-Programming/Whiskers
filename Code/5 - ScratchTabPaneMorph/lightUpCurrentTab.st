
!ScratchTabPaneMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 16:14'!
lightUpCurrentTab

	(self submorphs) do: [:m |
		(m isKindOf: ScratchTabMorph) ifTrue: [
			m id = currentTab
				ifTrue: [m selected: true]
				ifFalse: [m selected: false]
		]
	].
! !
