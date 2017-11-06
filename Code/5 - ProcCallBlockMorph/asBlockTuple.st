
!ProcCallBlockMorph methodsFor: 'as yet unclassified' stamp: 'EMP 11/4/2017 22:32'!
asBlockTuple
	| blockTuple argList arg |
	blockTuple _ Array new: argMorphs size + 2.
	blockTuple at: 1 put: #call.
	blockTuple at: 2 put: (self commandSpec).
	argList _ argMorphs.
	argList _ self organizeArgs: argList.
	1 to: argList size do: [:i |
		arg _ argList at: i.
		(arg isKindOf: ArgMorph) | (arg isKindOf: EventTitleMorph)
			ifTrue: [blockTuple at: i + 2 put: arg evaluate]
			ifFalse: [blockTuple at: i + 2 put: arg asBlockTuple]].
^ blockTuple! !
