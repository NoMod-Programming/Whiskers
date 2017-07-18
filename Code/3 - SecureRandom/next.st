
!SecureRandom methodsFor: 'accessing' stamp: 'len 8/4/2002 00:22'!
next
	^ self nextRandom160 bitAnd: 16rFF! !
