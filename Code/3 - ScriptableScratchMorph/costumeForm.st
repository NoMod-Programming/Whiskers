
!ScriptableScratchMorph methodsFor: 'accessing' stamp: 'EMP 7/16/2017 11:02'!
costumeForm
	"Answer my current costume form, without filtering, rotation or scaling. If my costume is a movie or animation, answer the appropriate frame."

	^ costume compositeFormForScale: 1.0
! !
