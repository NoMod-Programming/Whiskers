

!ASN1ByteArrayType methodsFor: 'decoding' stamp: 'rww 3/26/2007 06:00'!

decodeValueWithDERStream: derStream length: length



	^(derStream next: length) asByteArray! !

