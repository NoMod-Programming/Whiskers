

!CryptoRC4Test methodsFor: 'as yet unclassified' stamp: 'rww 4/10/2007 17:55'!

genericARC4TestKey: key plaintext: plaintext ciphertext: ciphertext

	| vector rc4 |

	vector := plaintext copy.

	rc4 := ARC4 new.

	rc4 key: key.

	vector := rc4 encrypt: vector.

	self assert: vector = ciphertext! !

