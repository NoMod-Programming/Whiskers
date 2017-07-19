

!Rijndael methodsFor: 'key schedule' stamp: 'len 8/15/2002 01:34'!

expandKey: aByteArray

	| w total want sw key |

	key := self stateFromBytes: aByteArray columns: nK.

	total := nB * (nR + 1).

	w := Array new: total.



	1 to: nK do: [:n | 

		w at: n put: (key at: n)].

	nK + 1 	to: total do: [:n | 

		want := (w at: n - 1) copy.

		(n - 1 \\ nK) = 0 ifTrue: 

			[sw := ByteArray new: 4.

			sw at: 1 put: 

				((SubByte at: (want byteAt: 2) + 1) bitXor: (RoundConstant at: n-1 / nK)).

			2 to: 4 do: [:i |

				sw at: i put: (SubByte at: (want byteAt: i \\ 4 + 1) + 1)].

			sw := ThirtyTwoBitRegister loadFrom: sw at: 1]

		ifFalse: 

			[(n - 1 \\ nK = 4) & (nK > 6) ifTrue: 

				[sw := ByteArray new: 4.

				1 to: 4 do: [:i | sw at: i put: (SubByte at: (want byteAt: i) + 1)].

				sw := ThirtyTwoBitRegister loadFrom: sw at: 1]

			ifFalse:

				[sw := want]

			].

		w at: n put: ((w at: n - nK) copy bitXor: sw).

		].

	expandedKey := w! !

