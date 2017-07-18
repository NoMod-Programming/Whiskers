
!BlockCreationDialog methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:45'!
isAtomic: aBoolean
	| isAtomicButtonTemp |
	isAtomic _ aBoolean.
aBoolean ifTrue: [isAtomicButtonTemp _ (isAtomicButton submorphs detect: [:m | m isKindOf: ToggleButton] ifNone: [nil]). isAtomicButtonTemp ifNotNil: [isAtomicButtonTemp on]] ifFalse: [isAtomicButtonTemp _ (isAtomicButton submorphs detect: [:m | m isKindOf: ToggleButton] ifNone: [nil]). isAtomicButtonTemp ifNotNil: [isAtomicButtonTemp off]].! !
