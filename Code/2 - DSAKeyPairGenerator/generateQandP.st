
!DSAKeyPairGenerator methodsFor: 'as yet unclassified' stamp: 'len 10/25/2002 15:14'!
generateQandP
	"Generate the two industrial-grade primes, q (160-bits) and p (512-bit) needed to build a key set. Answer the array (q, p, s), where s is the seed that from which q and p were created. This seed is normally discarded, but can be used to verify the key generation process if desired."

	| pBits halfTwoToTheP chunkCount twoQ n c w |
	pBits := 512.  "desired size of p in bits"
	halfTwoToTheP := 2 raisedTo: (pBits - 1).
	chunkCount := pBits // 160.

	Transcript show: 'Searching for primes q and p...'; cr.
	[true] whileTrue: [
		Transcript show: '  Found a candidate q.'; cr.
		q := random nextBits: 160.
		q := q bitOr: 1. "ensure it is odd"
		q := q bitOr: 1 << 160. "ensure it is of the requiered length"
		q := (PrimesFinder candidate: q) nextPrime.
		twoQ := q bitShift: 1.
		n := 2.
		c := 0.
		[c < 4096] whileTrue: [
			w := random nextBits: pBits.
			x := w + halfTwoToTheP.
			p := (x - ( x \\ twoQ)) + 1.
			p highBit = pBits ifTrue: [
				Transcript show: '    Testing potential p ', (c + 1) printString, '...'; cr.
				(self isProbablyPrime: p) ifTrue: [
					Transcript show: '  Found p!!'; cr.
					^ self]].
			n := n + chunkCount + 1.
			c := c + 1]]! !
