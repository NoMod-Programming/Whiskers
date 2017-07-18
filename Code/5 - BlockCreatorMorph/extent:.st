
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 09:59'!
extent: aPoint
	| d |
	super extent: aPoint.
(d _ (self ownerThatIsA: BlockCreationDialog)) ifNotNil: [d updateWidth: self width]! !
