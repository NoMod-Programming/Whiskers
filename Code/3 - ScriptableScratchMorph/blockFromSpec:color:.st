
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 17:04'!
blockFromSpec: spec color: blockColor
	"Create a block from the given block specification. Answer nil if I don't implement the block spec selector."

	| blockLabelSpec blockType selector defaultArgs block rcvr argPermutation |
	<pragma: #i18nIssue>
	blockLabelSpec := ScratchTranslator translationFor: (spec at: 1).
	argPermutation := CommandBlockMorph argPermutationForSpec: (spec at: 1) withTranslation: blockLabelSpec.
	blockType := spec at: 2.
	selector := (spec at: 3) asSymbol.
	defaultArgs := self defaultArgsFor: spec.

	(#(call getParam) includes: (spec third)) ifTrue: [^ self procBlockFromSpec: spec color: blockColor].

	(#(E K M S W B H C) includes: blockType) ifTrue: [
		^ (self hatBlockType: blockType) color: blockColor].

	"basic block type: normal or C-shaped"
	(blockType includes: $c)
		ifTrue:	[
			selector = #doIfElse
				ifTrue: [block := IfElseBlockMorph new isSpecialForm: true]
				ifFalse: [block := CBlockMorph new isSpecialForm: true]]
		ifFalse:	[
			(blockType includes: $r) | (blockType includes: $b)
				ifTrue: [block := ReporterBlockMorph new]
				ifFalse: [block := CommandBlockMorph new]].

	(blockType includes: $b) ifTrue: [block isBoolean: true].
	(blockType includes: $s) ifTrue: [block isSpecialForm: true].
	(blockType includes: $t) ifTrue: [block isTimed: true].

	(ScriptableScratchMorph isSpriteSpecificTarget: self selector: selector)
		ifTrue: [rcvr := self]
		ifFalse: [rcvr := self ownerOrYourselfThatIsA: ScratchStageMorph].

	^ block
		argPermutation: argPermutation;
		color: blockColor;
		selector: selector;
		commandSpec: blockLabelSpec;
		defaultArgs: defaultArgs;
		receiver: rcvr
! !
