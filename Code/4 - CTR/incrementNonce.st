
!CTR methodsFor: 'accessing' stamp: 'cmm 5/11/2006 22:42'!
incrementNonce
	"increment my nonce"
	| answer |
	answer := self nonce + 1.
	self nonce: answer.
	^ answer! !
