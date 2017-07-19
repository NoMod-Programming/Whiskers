

!DSAKeyPairGenerator methodsFor: 'as yet unclassified' stamp: 'rww 10/16/2016 19:32'!

generate1024bitKeySet

	"Generate and answer a key set for DSA. The result is a pair (<private key><public key>). Each key is an array of four large integers. The private key is (p, q, g, x); the public one is (p, q, g, y). The signer must be sure to record (p, q, g, x), and must keep x secret to prevent someone from forging their signature."

	"Note: Key generation can take some time. Open a transcript so you can see what's happening and take a coffee break!!"



	| exp h |

	random := SecureRandom new.

	self generate1024bitQandP.

	exp := (p - 1) / q.

	h := 2.

	[g := h raisedTo: exp modulo: p. g = 1] whileTrue: [h := h + 1].

	x := self nextRandom160.

	y := g raisedTo: x modulo: p.

! !

