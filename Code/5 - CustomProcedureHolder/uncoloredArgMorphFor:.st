
!CustomProcedureHolder methodsFor: 'private' stamp: 'EMP 7/17/2017 12:08'!
uncoloredArgMorphFor: specString
	"Answer an argument morph for the given argument specification string."

	| code |
	code _ specString copyFrom: 2 to: (specString size).
	's' = code ifTrue: [^ CustomReporterMorph new isBoolean: false].
	'n' = code ifTrue: [^ CustomReporterMorph new isBoolean: false].
	'b' = code ifTrue: [^ CustomReporterMorph new isBoolean: true].
	'c' = code ifTrue: [^ CustomReporterMorph new isBoolean: false].
	^ (StringMorph contents: code asString font: (ScratchFrameMorph getFont: #Label)) color: self labelColor! !
