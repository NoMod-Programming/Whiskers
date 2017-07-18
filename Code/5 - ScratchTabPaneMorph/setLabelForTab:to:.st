
!ScratchTabPaneMorph methodsFor: 'private' stamp: 'EMP 7/14/2017 16:12'!
setLabelForTab: tabID to: aString

	| theTab wInitial wDelta |
	self submorphs do: [:m |
		((m isKindOf: ScratchTabMorph) and:
		 [m id = tabID]) ifTrue: [
			theTab := m.
			wInitial := m width.
			m label: aString.
			wDelta := m width - wInitial]].

	theTab ifNotNil: [
		self submorphs do: [:m |
			((m isKindOf: ScratchTabMorph) and: [m left > (theTab left)])
				ifTrue: [
					"scoot the others down if the tab's width changed"
					m position: (m position) + (wDelta@0)]]].
! !
