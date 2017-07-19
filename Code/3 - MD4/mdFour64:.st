

!MD4 methodsFor: 'computing' stamp: 'LC 6/24/2001 15:49'!

mdFour64: array 

	| aa bb cc dd indexes s |

	aa := a.

	bb := b.

	cc := c.

	dd := d.

	indexes := #(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16) readStream.

	s := #(3 7 11 19 3 7 11 19 3 7 11 19 3 7 11 19) readStream.

	[indexes atEnd]

		whileFalse: [self fRound: (array at: indexes next)

				shift: s next; turn].

	indexes := #(1 5 9 13 2 6 10 14 3 7 11 15 4 8 12 16) readStream.

	s := #(3 5 9 13 3 5 9 13 3 5 9 13 3 5 9 13) readStream.

	[indexes atEnd]

		whileFalse: [self gRound: (array at: indexes next)

				shift: s next; turn].

	indexes := #(1 9 5 13 3 11 7 15 2 10 6 14 4 12 8 16) readStream.

	s := #(3 9 11 15 3 9 11 15 3 9 11 15 3 9 11 15) readStream.

	[indexes atEnd]

		whileFalse: [self hRound: (array at: indexes next)

				shift: s next; turn].

	a := a + aa bitAnd: 16rFFFFFFFF.

	b := b + bb bitAnd: 16rFFFFFFFF.

	c := c + cc bitAnd: 16rFFFFFFFF.

	d := d + dd bitAnd: 16rFFFFFFFF! !

