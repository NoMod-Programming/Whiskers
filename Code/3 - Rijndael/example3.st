
!Rijndael methodsFor: 'examples' stamp: 'len 8/21/2002 16:22'!
example3
	| k pt |
	k := #(16r2B 16r7E 16r15 16r16 16r28 16rAE 16rD2 16rA6 16rAB 16rF7 16r15 16r88 16r09 16rCF 16r4F 16r3C) asByteArray.
	pt := #(16r32 16r43 16rF6 16rA8 16r88 16r5A 16r30 16r8D 16r31 16r31 16r98 16rA2 16rE0 16r37 16r07 16r34) asByteArray.

	self key: k.
	Transcript cr; show: pt hex.
	self encryptBlock: pt.
	Transcript cr; show: pt hex.
	self decryptBlock: pt.
	Transcript cr; show: pt hex! !
