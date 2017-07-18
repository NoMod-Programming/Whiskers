
!CustomBlockLabelMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 11:53'!
fixArgLayout

	| top xInset extraW |
	top _ self top + 1.
	isNumber
		ifTrue: [
			self extent: labelMorph extent + (5 @ 2).
			"tiny vertical adjustment to account for differences in string rendering"
			Smalltalk isWindows ifFalse: [top _ top + 1].
			"for tall fonts, add extra width"
			extraW _ (self height - (1.3 * self width) rounded) max: 0.
			extraW > 0 ifTrue: [self width: self width + extraW].
			xInset _ 4 + (extraW // 2)]
		ifFalse: [
			self extent: labelMorph extent + (2 @ 2).
			xInset _ 3].

	ScratchTranslator isRTL
		ifTrue: [labelMorph position: (self right - (xInset + labelMorph width)) @ top]
ifFalse: [labelMorph position: (self left + xInset) @ top].! !
