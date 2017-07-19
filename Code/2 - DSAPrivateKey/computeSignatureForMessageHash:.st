

!DSAPrivateKey methodsFor: 'private' stamp: 'len 11/15/2002 23:18'!

computeSignatureForMessageHash: hash

	"Answer the digital signature of the given message hash using the given private key. A signature is a pair of large integers."



	| r s k tmp |

	r := s := 0.

	[r = 0 or: [s = 0]] whileTrue: [

		k := self nextRandom160 \\ q.

		r := (g raisedTo: k modulo: p) \\ q.

		tmp := (hash asInteger + (x * r)) \\ q.

		s := (k inverseModulo: q) * tmp \\ q].

	^ Array with: r with: s! !

