
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 14:34'!
procBlockFromSpec: spec color: blockColor
	"Create a block from the given block specification. Answer nil if I don't implement the block spec selector."

	| blockLabelSpec blockType selector defaultArgs block rcvr argPermutation |
	blockLabelSpec _ ScratchTranslator translationFor: (spec at: 1).
	argPermutation _ CommandBlockMorph argPermutationForSpec: (spec at: 1) withTranslation: blockLabelSpec.
	blockType _ spec at: 2.
	selector _ (spec at: 3) asSymbol.
	defaultArgs _ self defaultArgsFor: spec.


	"basic block type: normal or C-shaped"
	(blockType includes: $c)
		ifTrue:	[
			selector = #doIfElse
				ifTrue: [block _ IfElseBlockMorph new isSpecialForm: true]
				ifFalse: [block _ CBlockMorph new isSpecialForm: true]]
		ifFalse:	[
			(blockType includes: $r) | (blockType includes: $b)
				ifTrue: [block _ ReporterBlockMorph new]
				ifFalse: [block _ ProcCallBlockMorph new]].

	(blockType includes: $b) ifTrue: [block isBoolean: true].
	(blockType includes: $s) ifTrue: [block isSpecialForm: true].
	(blockType includes: $t) ifTrue: [block isTimed: true].

	(ScriptableScratchMorph isSpriteSpecificTarget: self selector: selector)
		ifTrue: [rcvr _ self]
		ifFalse: [rcvr _ self ownerThatIsA: ScratchStageMorph].

	^ block
		argPermutation: argPermutation;
		color: blockColor;
		selector: #call;
		commandSpec: blockLabelSpec;
		defaultArgs: defaultArgs;
receiver: rcvr! !
