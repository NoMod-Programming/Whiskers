
!IfElseBlockMorph methodsFor: 'layout' stamp: 'EMP 7/16/2017 19:36'!
doBlockLayout
	"Update the positions of my submorphs."

	| newH |

	"fix trueBlock, falseBlock, and nextBlock in case they've been removed from me"
	(trueBlock notNil and: [trueBlock owner ~~ self]) ifTrue: [trueBlock := nil].
	(falseBlock notNil and: [falseBlock owner ~~ self]) ifTrue: [falseBlock := nil].
	(nextBlock notNil and: [nextBlock owner ~~ self]) ifTrue: [nextBlock := nil].

	super doBlockLayout.

	newH := self topBarHeight + 3.

	trueBlock
		ifNil: [newH := newH + 15]
		ifNotNil: [
			trueBlock fullBounds.
			ScratchTranslator isRTL
				ifTrue: [trueBlock position: (self right - trueBlock width - CBlockBracketThickness)@(self top + newH)]
				ifFalse: [trueBlock position: self position + (CBlockBracketThickness@newH)].
			newH := newH + trueBlock fullBounds height.
			trueBlock blockSequence last isStopOrForever ifTrue: [newH := newH + 4]].

	elseBarY := newH - 4.
	newH := newH + self elseBarHeight + 1.

	falseBlock
		ifNil: [newH := newH + 15]
		ifNotNil: [
			falseBlock fullBounds.
			ScratchTranslator isRTL
				ifTrue: [falseBlock position: (self right - falseBlock width - CBlockBracketThickness)@(self top + newH)]
				ifFalse: [falseBlock position: self position + (CBlockBracketThickness@newH)].
			newH := newH + falseBlock fullBounds height.
			falseBlock blockSequence last isStopOrForever ifTrue: [newH := newH + 4]].

	newH := newH + CBlockBracketThickness.
	self height: newH.
	nextBlock ifNotNil: [ScratchTranslator isRTL
		ifTrue: [nextBlock position: (self right - nextBlock width)@(self bottom - 4)]
		ifFalse: [nextBlock position: self left@(self bottom - 4)]].

	ScratchTranslator isRTL
		ifTrue: [elseMorph position: (self right - elseMorph width - 6)@(self top + elseBarY
			+ ((ScratchTranslator centerOffsetForButtonWithFont: (ScratchFrameMorph getFont: #Label)) // 4))]
		ifFalse: [elseMorph position: (self left + 6)@(self top + elseBarY
			+ ((ScratchTranslator centerOffsetForButtonWithFont: (ScratchFrameMorph getFont: #Label)) // 4))].
! !
