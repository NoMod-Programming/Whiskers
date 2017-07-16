
!ScriptableScratchMorph methodsFor: 'sensing ops' stamp: 'EMP 7/13/2017 19:11'!
mouseY

	^ ((self globalPointToLocal: self currentHand lastEvent position) y negated max: -180) min: 180
! !
