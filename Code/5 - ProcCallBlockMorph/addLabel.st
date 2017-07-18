
!ProcCallBlockMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 14:41'!
addLabel
	"Add a label for my command and arguments. This is the method that really creates the whole block."
	"Details: We remove all the pieces of this block, and then reassemble them, being careful not to destroy any argument morphs that we might still want to use. This is helpful if someone adds/removes parameters from a hat block. Percent signs with a slash after them (%/) are commented and treated as part of the label"

	| tokens args nextArgIndex m next |
	commandSpec ifNil: [^ self].

	"we make sure not to remove the next block."
	next _ self nextBlock.
	self removeAllMorphsIn: (self submorphs reject: [:t | t = next]).

	tokens _ CommandBlockMorph parseCommandSpec: commandSpec.
	args _ tokens select: [:s | BlockCreatorMorph isArgSpec: s].

	"remove any excess arg morphs from the list."
	[argMorphs size > args size] whileTrue: [
		m _ argMorphs last.
		argMorphs remove: m.

		"if the argument we're throwing out is anything complicated, we'd like to keep it around in the world."
		(m isKindOf: BlockMorph) ifTrue: [m openInWorld]].

	"create new arg morphs."
	[argMorphs size < args size] whileTrue: [
		argMorphs addLast: (self argMorphFor: (args at: argMorphs size + 1))].

	nextArgIndex _ 1.

	tokens do: [:spec |
		| s |
		s _ spec.
		(BlockCreatorMorph isArgSpec: s)
			ifTrue:	[
				m _ argMorphs at: nextArgIndex.
				nextArgIndex _ nextArgIndex + 1]
			ifFalse:	[
				m _ self labelMorphFor: s].
		self addMorphBack: m].

	self isReporter ifTrue: [
		m _ submorphs first.
		((m isKindOf: ChoiceArgMorph) | (m isKindOf: SpriteArgMorph)) ifTrue: [  "add spacer"
			self addMorphFront: (Morph new color: Color transparent; extent: 2@5)].

		m _ submorphs last.
		((m isKindOf: ChoiceArgMorph) | (m isKindOf: SpriteArgMorph)) ifTrue: [  "add spacer"
self addMorphBack: (Morph new color: Color transparent; extent: 2@5)]].! !
