
!ScriptableScratchMorph methodsFor: 'sensing ops' stamp: 'EMP 7/13/2017 19:10'!
mouseX

	^ ((self globalPointToLocal: self currentHand lastEvent position) x max: -240) min: 240
! !