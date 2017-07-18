
!ARC4 methodsFor: 'accessing' stamp: 'len 8/6/2002 20:08'!
key: aByteArray
	| k other |
	sbox := (0 to: 255) asByteArray.
	k := (0 to: 255) collect: [ :each | aByteArray at: each \\ aByteArray size + 1].
	other := 0.
	1 to: 256 do: [ :each |
		other := other + (sbox at: each) + (k at: each) \\ 256.
		sbox swap: each with: other+1].
	i := j := 0! !
