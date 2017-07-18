
!ASN1StringType methodsFor: 'decoding' stamp: 'rww 3/26/2007 06:06'!
decodeValueWithDERStream: derStream length: length

	^(derStream next: length) asByteArray asString.
! !
