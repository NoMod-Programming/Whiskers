
!ScratchThumbnailMorph methodsFor: 'stepping' stamp: 'EMP 7/13/2017 13:06'!
step
	"Optimization: Don't update unless the costume has changed."

	| delta |

	(target notNil and:
	 [lastUpdateMSecs = target costumeChangeMSecs])
		ifTrue: [^ self].

	delta := Time millisecondClockValue - lastUpdateMSecs.
	(delta < 0) | (delta > 100) ifTrue: [self updateThumbnail].
! !
