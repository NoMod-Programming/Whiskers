
!ScratchProcess methodsFor: 'private-stack' stamp: 'EMP 7/17/2017 15:42'!
bindStopBlocksIn: aSequence to: aStackFrame 
	aSequence do: [:topBlock | topBlock
			allMorphsDo: [:block | ((block isKindOf: CommandBlockMorph)
					and: [block selector = #stopScripts or: [block selector = #report]])
						ifTrue: [block stopFrame: aStackFrame]]]! !
