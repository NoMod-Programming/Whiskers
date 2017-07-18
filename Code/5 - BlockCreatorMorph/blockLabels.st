
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 10:01'!
blockLabels
^ (self submorphs select: [:m | m isKindOf: CustomBlockLabelMorph]), (self submorphs select: [:m | m isKindOf: ColoredExpressionArgMorph])! !
