

!MD4 methodsFor: 'computing' stamp: 'len 10/16/2002 16:26'!

run

	| n buffer bb j offset |

	buffer := ByteArray new: 128.

	n := input size.

	bb := n * 8.

	j := 0.

	[n > 64]

		whileTrue: 

			[self mdFour64: (self copy64: input startingAt: j + 1).

			j := j + 64.

			n := n - 64].

	buffer atAllPut: 0.

	1 to: n do: [:i | buffer at: i put: (input at: j + i)].

	buffer at: n + 1 put: 16r80.

	offset := n <= 55 ifTrue: [56] ifFalse: [120].

	self copy4: bb to: buffer startingAt: offset + 1.

	self mdFour64: (self copy64: buffer).

	n > 55 ifTrue: [self mdFour64: (self copy64: buffer startingAt: 64)].

	buffer atAllPut: 0.

	self copy4ToOutput.

	a := b := c := d := 0! !

