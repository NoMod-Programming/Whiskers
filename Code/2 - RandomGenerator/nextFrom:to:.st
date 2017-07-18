
!RandomGenerator methodsFor: 'accessing' stamp: 'cmm 5/4/2006 00:09'!
nextFrom: start to: end
	"Answer a random integer between start and end."
	| r |
	r := self nextInt: end-start+1.
	^ r+start-1! !
