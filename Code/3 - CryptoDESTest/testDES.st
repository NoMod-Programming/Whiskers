

!CryptoDESTest methodsFor: 'as yet unclassified' stamp: 'rww 10/5/2006 07:33'!

testDES

	| plain key d |

	plain := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.

	key := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) asByteArray.

	d := DES key: key.

	d encryptBlock: plain.

	self assert: plain = #(16rC9 16r57 16r44 16r25 16r6A 16r5E 16rD3 16r1D) asByteArray! !

