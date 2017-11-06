
!BlockCreationDialog methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 22:28'!
isAtomic: aBoolean
	| isAtomicButtonTemp |
	self flag: #refactor.
	isAtomic := aBoolean.
aBoolean ifTrue: [isAtomicButtonTemp := (isAtomicButton submorphs detect: [:m | m isKindOf: ToggleButton] ifNone: [nil]). isAtomicButtonTemp ifNotNil: [isAtomicButtonTemp on]] ifFalse: [isAtomicButtonTemp := (isAtomicButton submorphs detect: [:m | m isKindOf: ToggleButton] ifNone: [nil]). isAtomicButtonTemp ifNotNil: [isAtomicButtonTemp off]].! !
