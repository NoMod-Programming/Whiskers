
!ProcedureHatBlockMorph methodsFor: 'accessing' stamp: 'EMP 7/17/2017 09:47'!
defaultNames
	| result |
	result _ OrderedCollection new.
	((CommandBlockMorph parseCommandSpec: spec) select: [:s | BlockCreatorMorph isArgSpec: s]) do: [:arg | (arg = '%b') ifTrue: [result add: false] ifFalse: [(arg = '%s') ifTrue: [result add: ''] ifFalse: [result add: '10']]].
	^ result asArray! !
