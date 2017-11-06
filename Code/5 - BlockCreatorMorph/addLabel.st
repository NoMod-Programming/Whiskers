
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 11/5/2017 22:29'!
addLabel
	"Add a label for my command and arguments. This is the method that really creates the whole block."
	"Details: We remove all the pieces of this block, and then reassemble them, being careful not to destroy any argument morphs that we might still want to use. This is helpful if someone adds/removes parameters from a hat block."

	| tokens args nextArgIndex m |
	commandSpec ifNil: [^ self].

	"we make sure not to remove the next block."
	self removeAllMorphs.

	tokens := BlockCreatorMorph parseCommandSpec: commandSpec.
	args := tokens select: [:s | BlockCreatorMorph isArgSpec: s].

	"remove any excess arg morphs from the list."
	[argMorphs size > 0] whileTrue: [
		m := argMorphs last.
		argMorphs remove: m.

		"if the argument we're throwing out is anything complicated, we'd like to keep it around in the world."
		(m isKindOf: BlockMorph) ifTrue: [m openInWorld]].

	"create new arg morphs."
	[argMorphs size < args size] whileTrue: [
		argMorphs addLast: (self argMorphFor: (args at: argMorphs size + 1))].

	nextArgIndex := 1.
	Transcript show: tokens.
	tokens do: [:s |
		(BlockCreatorMorph isArgSpec: s)
			ifTrue:	[
				m := argMorphs at: nextArgIndex.
				nextArgIndex := nextArgIndex + 1]
			ifFalse:	[
				m := self labelMorphFor: s].
		self addMorphBack: m].

	self isReporter ifTrue: [
		m := submorphs first.
		((m isKindOf: ChoiceArgMorph) | (m isKindOf: SpriteArgMorph)) ifTrue: [  "add spacer"
			self addMorphFront: (Morph new color: Color transparent; extent: 2@5)].

		m := submorphs last.
		((m isKindOf: ChoiceArgMorph) | (m isKindOf: SpriteArgMorph)) ifTrue: [  "add spacer"
self addMorphBack: (Morph new color: Color transparent; extent: 2@5)]].! !
