
!SHA1 methodsFor: 'primitives' stamp: 'jm 12/21/1999 20:13'!
primHashBlock: blockBitmap using: workingTotalsBitmap
	"Hash the given block (a Bitmap) of 80 32-bit words, using the given workingTotals."

	<primitive: 'primitiveHashBlock' module: 'DSAPrims'>
	^ self primitiveFailed
! !
