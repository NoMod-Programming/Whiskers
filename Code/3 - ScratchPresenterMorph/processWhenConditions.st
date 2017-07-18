
!ScratchPresenterMorph methodsFor: 'event handling' stamp: 'EMP 7/16/2017 20:34'!
processWhenConditions
	"Trigger any 'when <condition>' hats."
	| objList |
	objList := stage submorphs select: [:m | m isScriptableScratchMorph].
	objList := objList copyWith: stage.
	objList do: [:obj |
		obj scripts do: [:hat |
			(hat isWhenHatMorph) ifTrue: [
				(hat hasRunningProcess not and: [hat evaluateCondition]) ifTrue: [
					hat startProcess; layoutChanged]]]].
! !
