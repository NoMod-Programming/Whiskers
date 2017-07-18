
!MD5 methodsFor: 'private-buffers' stamp: 'ul 3/3/2008 22:51'!
storeLength: bitLength in: aByteArray
	"Fill in the final 8 bytes of the given ByteArray with a 64-bit
	little-endian representation of the original message length in bits."

	| n i |
	n := bitLength.
	i := aByteArray size - 8 + 1.
	[n > 0] whileTrue: [
		aByteArray at: i put: (n bitAnd: 16rFF).
		n := n bitShift: -8.
		i := i + 1].
! !
