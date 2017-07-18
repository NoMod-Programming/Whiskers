
!ASN1MappingSubType methodsFor: 'decoding' stamp: 'rww 3/28/2007 07:06'!
decodeWithDERStream: derStream

	| target val |
	target := self mapping new.
	val := self parent decodeWithDERStream: derStream.
	target perform: self mutator with: val.
	^ target
! !
