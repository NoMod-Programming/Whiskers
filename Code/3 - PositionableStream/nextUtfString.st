
!PositionableStream methodsFor: '*cryptography-core' stamp: 'rww 1/13/2003 00:10'!
nextUtfString

	^ (self next: self uint16) asString.
! !
