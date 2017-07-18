
!MouseClickEventHatMorph methodsFor: 'other' stamp: 'EMP 7/16/2017 19:38'!
receiverName

	(scriptOwner isScratchStageMorph)
		ifTrue: [^ 'Stage' localized]
		ifFalse: [^ 'this sprite' localized].
! !
