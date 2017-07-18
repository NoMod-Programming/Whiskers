
!BlockCreatorMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 09:56'!
width: aPoint
	| d |
	super width: aPoint.
	(d _ (self ownerThatIsA: BlockCreationDialog)) ifNotNil: [d updateWidth: self width]! !
