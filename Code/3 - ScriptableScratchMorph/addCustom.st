
!ScriptableScratchMorph methodsFor: 'private' stamp: 'EMP 7/17/2017 14:43'!
addCustom

	| array spec params isAtomic f sf b |
	array _ BlockCreationDialog new getUserResponse. "The result is an array: [[blockSpec, variable names], isAtomic]"
	Transcript show: array.
	array = false ifTrue: [^ self].
	spec _ array first first.
	spec withoutLeadingBlanks withoutTrailingBlanks = '' ifTrue: [^ self].
	params _ array first second.
	isAtomic _ array second.
	b _ (self blocksBin submorphs select: [:m | m isKindOf: BlockMorph]).
	(self findAnySpec: spec) ifTrue: [^ DialogBoxMorph warn: 'A block with that name already exists'].
	(b isEmptyOrNil) ifFalse: [
	blocksBin addMorphBack: ((ProcedureHatBlockMorph fromSpec: spec params: params isAtomic: isAtomic) scriptOwner: self; position: (b last fullBounds bottomLeft + (0 @ 10)))] ifTrue: [blocksBin addMorphBack: ((ProcedureHatBlockMorph fromSpec: spec params: params isAtomic: isAtomic) scriptOwner: self; position: (self blocksBin topLeft + (20@20)))].
	blocksBin changed.
	self changed.
	(f _ self ownerThatIsA: ScratchFrameMorph) ifNotNil: [(sf _ f viewerPane) ifNotNil: [sf categoryChanged: (sf currentCategory)]].! !
