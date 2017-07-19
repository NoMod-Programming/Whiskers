

!Rijndael class methodsFor: 'class initialization' stamp: 'cs 8/8/2002 16:48'!

calculateInvTTables

	| a t coef1 coef2 coef3 coef4 |

	InvT0 := Array new: 256.

	InvT1 := Array new: 256.

	InvT2 := Array new: 256.

	InvT3 := Array new: 256.



	coef1 := 14.

	coef2 := 9.

	coef3 := 13.

	coef4 := 11.

	0 to: 255 do: [:avalue  |

		a := self subByteInverse: avalue.

		t := ThirtyTwoBitRegister 

			byte1: (self multiply: a by: coef1)

			byte2: (self multiply: a by: coef2)

			byte3: (self multiply: a by: coef3)

			byte4: (self multiply: a by: coef4).

		InvT0 at: avalue+1 put: t. 

		t := t copy leftRotateBy: -8.

		InvT1 at: avalue+1 put: t. 

		t := t copy leftRotateBy: -8.

		InvT2 at: avalue+1 put: t. 

		t := t copy leftRotateBy: -8.

		InvT3 at: avalue+1 put: t. 

		].

! !

