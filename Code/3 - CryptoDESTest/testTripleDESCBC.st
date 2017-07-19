

!CryptoDESTest methodsFor: 'as yet unclassified' stamp: 'rww 3/30/2007 20:19'!

testTripleDESCBC

	| plain key encryptor decryptor vector |

	plain := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.

	key := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) asByteArray.

	vector := #(16r00 16r11 16r22 16r33 16r44 16r55 16r66 16r77) asByteArray.

	encryptor := (TripleDES key: key) cbc.

	encryptor initialVector: vector copy.

	decryptor := (TripleDES key: key) cbc.

	decryptor initialVector: vector copy.

	encryptor encryptBlock: plain.

	decryptor decryptBlock: plain.

	encryptor encryptBlock: plain.

	decryptor decryptBlock: plain.

	self assert: plain = #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.! !

