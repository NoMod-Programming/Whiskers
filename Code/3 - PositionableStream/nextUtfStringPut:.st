
!PositionableStream methodsFor: '*cryptography-core' stamp: 'rww 1/13/2003 00:10'!
nextUtfStringPut: s 

	self uint16: s size.
	self nextPutAll: s asByteArray.
! !
