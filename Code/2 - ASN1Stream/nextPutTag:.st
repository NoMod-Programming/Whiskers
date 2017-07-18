
!ASN1Stream methodsFor: 'stream - api' stamp: 'rww 3/25/2007 11:16'!
nextPutTag: tag
	"It's not clear how to encode a tag whose numerical value is greater than 30"

	self nextPut: tag.
! !
