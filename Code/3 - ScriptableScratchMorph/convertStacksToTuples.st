
!ScriptableScratchMorph methodsFor: 'blocks' stamp: 'EMP 7/17/2017 19:28'!
convertStacksToTuples
	"Convert my blocks bin from a morph containing block stack into a collection of (<point>, <tuple>) pairs the represent the same stacks in compact, language-independent form."

	| stacks blocks comments |

	(blocksBin isArray) ifTrue: [^ self].  "already converted"

	stacks := (blocksBin submorphs select: [:m | m respondsTo: #tupleSequence]).
	blocks := stacks select: [:m | m isBlockMorph].
	comments := stacks select: [:m | m isKindOf: ScratchCommentMorph].

	blocks := blocks collect: [:blockM |
		| blkPos |
		blkPos := blockM position - blocksBin position.
		Array
			with: blkPos x
			with: blkPos y
			with: blockM tupleSequence].

	comments := comments collect: [:blockM |
		| commentPos |
		commentPos := blockM position - blocksBin position.
		Array
			with: commentPos x
			with: commentPos y
			with: blockM tupleSequence].

	blocksBin := blocks, comments.
! !
