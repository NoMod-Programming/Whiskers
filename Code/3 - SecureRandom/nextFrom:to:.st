
!SecureRandom methodsFor: 'accessing' stamp: 'cmm 2/15/2006 00:00'!
nextFrom: start to: end
	"Answer a random integer between start and end."
	| r |
	r := self nextInt: end-start+1.
	^ r+start-1! !
