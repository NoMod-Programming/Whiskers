
!SHA1 methodsFor: 'private' stamp: 'jm 12/21/1999 23:32'!
processBufferUsingPrimitives: aByteArray
	"Process given 64-byte buffer using the primitives, accumulating the results in totals."

	| w |
	"expand and process the buffer"
	w := Bitmap new: 80.
	self primExpandBlock: aByteArray into: w.
	self primHashBlock: w using: totals.
! !
