
!CryptoRC4Test methodsFor: 'as yet unclassified' stamp: 'rww 10/5/2006 16:07'!
testARC4
	self genericARC4TestKey: #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) plaintext: #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) ciphertext: #(16r75 16rB7 16r87 16r80 16r99 16rE0 16rC5 16r96).
	self genericARC4TestKey: #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) plaintext: #(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) ciphertext: #(16r74 16r94 16rC2 16rE7 16r10 16r4B 16r08 16r79).
	self genericARC4TestKey: #(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) plaintext: #(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) ciphertext: #(16rDE 16r18 16r89 16r41 16rA3 16r37 16r5D 16r3A).
	self genericARC4TestKey: #(16rEF 16r01 16r23 16r45) plaintext: #(16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00 16r00) ciphertext: #(16rD6 16rA1 16r41 16rA7 16rEC 16r3C 16r38 16rDF 16rBD 16r61)! !
