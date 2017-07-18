
!SHA1 methodsFor: 'primitives' stamp: 'jm 12/21/1999 20:11'!
primExpandBlock: aByteArray into: wordBitmap
	"Expand the given 64-byte buffer into the given Bitmap of length 80."

	<primitive: 'primitiveExpandBlock' module: 'DSAPrims'>
	^ self primitiveFailed
! !
