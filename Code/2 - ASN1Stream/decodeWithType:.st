
!ASN1Stream methodsFor: 'decoding' stamp: 'rww 3/25/2007 23:53'!
decodeWithType: type

	^ type decodeWithDERStream: self.
! !
