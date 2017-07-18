
!PBEStorage methodsFor: 'converting' stamp: 'rww 10/22/2016 04:49'!
asByteArray

	| stream |
	stream := #[] writeStream.
	self writeTo: stream.
	^ stream contents.
! !
