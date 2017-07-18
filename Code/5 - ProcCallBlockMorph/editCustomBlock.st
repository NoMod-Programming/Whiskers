
!ProcCallBlockMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 14:41'!
editCustomBlock
	| block |
	block _ self receiver procedure: (self commandSpec).
	block ifNotNil: [
block editCustomBlock].! !
