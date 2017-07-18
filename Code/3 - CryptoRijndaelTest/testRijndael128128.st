
!CryptoRijndaelTest methodsFor: 'block ciphers' stamp: 'RobertWithers 10/12/2015 22:30'!
testRijndael128128
	| key vector cipher |
	key := #(16r2B 16r7E 16r15 16r16 16r28 16rAE 16rD2 16rA6 16rAB 16rF7 16r15 16r88 16r09 16rCF 16r4F 16r3C) asByteArray.
	vector := #(16r32 16r43 16rF6 16rA8 16r88 16r5A 16r30 16r8D 16r31 16r31 16r98 16rA2 16rE0 16r37 16r07 16r34) asByteArray.

	cipher := Rijndael new keySize: 16; key: key.
	cipher encryptBlock: vector.
	self assert: vector hex = '3925841d02dc09fbdc118597196a0b32'.
	cipher decryptBlock: vector.
	self assert: vector hex = '3243f6a8885a308d313198a2e0370734'! !
