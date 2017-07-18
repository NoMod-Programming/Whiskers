
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 15:14'!
customBlockFromSpec: spec color: blockColor
	"Create a block from the given block specification. Answer nil if I don't implement the block spec selector."

	| blockLabelSpec blockType selector defaultArgs block rcvr argPermutation |
	blockLabelSpec _ ScratchTranslator translationFor: (spec at: 1).
	argPermutation _ CommandBlockMorph argPermutationForSpec: (spec at: 1) withTranslation: blockLabelSpec.
	blockType _ spec at: 2.
	selector _ (spec at: 3) asSymbol.
	defaultArgs _ self defaultArgsFor: spec.

	(#(E K M S W Z) includes: blockType) ifTrue: [
		^ (self hatBlockType: blockType) color: blockColor].

	"basic block type: normal or C-shaped"
	(blockType includes: $c)
		ifTrue:	[
			selector = #doIfElse
				ifTrue: [block _ IfElseBlockMorph new isSpecialForm: true]
				ifFalse: [block _ CBlockMorph new isSpecialForm: true]]
		ifFalse:	[
			(blockType includes: $r) | (blockType includes: $b)
				ifTrue: [block _ CustomReporterMorph new]
				ifFalse: [block _ ProcCallBlockMorph new]].
	"DialogBoxMorph inform: blockType asString."
	(blockType includes: $b) ifTrue: [block isBoolean: true].
	(blockType includes: $s) ifTrue: [block isSpecialForm: true].
	(blockType includes: $t) ifTrue: [block isTimed: true].

	rcvr _ self.

	^ block
		argPermutation: argPermutation;
		color: blockColor;
		selector: selector;
		commandSpec: blockLabelSpec;
		defaultArgs: defaultArgs;
receiver: rcvr! !
