
!ScratchFrameMorph methodsFor: 'stepping' stamp: 'EMP 7/16/2017 20:33'!
processWhenConditions
	"Trigger any 'when <condition>' hats."
	| objList |
	objList := workPane submorphs select: [:m | m isScriptableScratchMorph].
	objList := objList copyWith: workPane.
	objList do: [:obj |
		obj scripts do: [:hat |
			(hat isWhenHatMorph) ifTrue: [
				(hat hasRunningProcess not and: [hat evaluateCondition]) ifTrue: [
					hat startProcess; layoutChanged]]]].
! !
