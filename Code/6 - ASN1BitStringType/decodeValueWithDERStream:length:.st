
!ASN1BitStringType methodsFor: 'decoding' stamp: 'rww 3/26/2007 05:59'!
decodeValueWithDERStream: derStream length: length

	| bitString |
	bitString := ASN1BitString new.
	bitString bitsPadding: derStream next.
	bitString bytes: (derStream next: length - 1).
	^ bitString
! !
