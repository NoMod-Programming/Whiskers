
!ASN1WrappedStringType methodsFor: 'decoding' stamp: 'rww 3/26/2007 06:01'!
decodeValueWithDERStream: derStream length: length

	| string |
	string := (derStream next: length) asByteArray asString.
	^ self wrapperClass fromString: string.
! !
