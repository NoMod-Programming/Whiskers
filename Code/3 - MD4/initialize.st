
!MD4 methodsFor: 'initialization' stamp: 'len 10/16/2002 16:23'!
initialize
	a := 16r67452301.
	b := 16rEFCDAB89.
	c := 16r98BADCFE.
	d := 16r10325476.
	output := ByteArray new: 16! !
