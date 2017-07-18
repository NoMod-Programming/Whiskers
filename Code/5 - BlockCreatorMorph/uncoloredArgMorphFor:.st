
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:08'!
uncoloredArgMorphFor: specString
	"Answer an argument morph for the given argument specification string."

	| code |
	code _ specString copyFrom: 2 to: specString size.
	's' = code ifTrue: [^ ColoredExpressionArgMorph new forType: #string].
	'n' = code ifTrue: [^ ColoredExpressionArgMorph new forType: #number].
	'b' = code ifTrue: [^ ColoredExpressionArgMorph new forType: #boolean].
	'c' = code ifTrue: [^ ColoredExpressionArgMorph new forType: #color].
	^ (StringMorph contents: code asString font: (ScratchFrameMorph getFont: #Label)) color: self labelColor! !
