
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 17:04'!
hatBlockType: blockType

	| stage evtName |
	'E' = blockType ifTrue: [
		evtName := ''.
		(stage := self ownerOrYourselfThatIsA: ScratchStageMorph)
			ifNotNil: [evtName := stage defaultEventName].
		^ EventHatMorph new scriptOwner: self; eventName: evtName].

	'K' = blockType ifTrue: [^ KeyEventHatMorph new scriptOwner: self].
	'M' = blockType ifTrue: [^ MouseClickEventHatMorph new scriptOwner: self].
	'S' = blockType ifTrue: [^ EventHatMorph new forStartEvent scriptOwner: self].
	'W' = blockType ifTrue: [^ WhenHatBlockMorph new scriptOwner: self].
	'B' = blockType ifTrue: [^ BackdropEventHatMorph new scriptOwner: self].
	'H' = blockType ifTrue: [^ WhenGreaterThanHatBlockMorph new scriptOwner: self].
	'C' = blockType ifTrue: [^ WhenClonedEventHatMorph new scriptOwner: self].! !
