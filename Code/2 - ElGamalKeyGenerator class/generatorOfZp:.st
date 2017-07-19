

!ElGamalKeyGenerator class methodsFor: 'utils' stamp: 'cmm 2/15/2006 00:04'!

generatorOfZp: safePrimeP

	"Finds a generator of Zp* where p is a safe prime: p = 2q+1 with q prime.

	The order of Zp* is n = p-1 = 2q, so we know the factorization of n.

	See Handbook of Applied Cryptography, Ch.4, p.163 "



	| alpha p n |

	p := safePrimeP.

	n := p - 1.

	[alpha := SecureRandom picker nextInt: n.

	((alpha raisedTo: n/2 modulo: p) = 1 or: [(alpha raisedTo: 2 modulo: p) = 1])] whileFalse.

	^ alpha! !

