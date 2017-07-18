
!Rijndael class methodsFor: 'class initialization' stamp: 'cs 8/8/2002 16:44'!
calculateTTables
	| a t coef1 coef2 coef3 coef4 |
	T0 := Array new: 256.
	T1 := Array new: 256.
	T2 := Array new: 256.
	T3 := Array new: 256.

	coef1 := 2.
	coef2 := 1.
	coef3 := 1.
	coef4 := 3.
	0 to: 255 do: [:avalue  |
		a := self subByte: avalue.
		t := ThirtyTwoBitRegister 
			byte1: (self multiply: a by: coef1)
			byte2: (self multiply: a by: coef2)
			byte3: (self multiply: a by: coef3)
			byte4: (self multiply: a by: coef4).
		T0 at: avalue+1 put: t. 
		t := t copy leftRotateBy: -8.
		T1 at: avalue+1 put: t. 
		t := t copy leftRotateBy: -8.
		T2 at: avalue+1 put: t. 
		t := t copy leftRotateBy: -8.
		T3 at: avalue+1 put: t. 
		].
! !
