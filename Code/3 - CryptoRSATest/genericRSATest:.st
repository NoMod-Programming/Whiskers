

!CryptoRSATest methodsFor: 'tests' stamp: 'rww 10/5/2006 06:48'!

genericRSATest: bits

	| generator public private msg c |

	generator := RSAKeyPairGenerator new bits: bits.

	public := generator publicKey. "this may take a while"

	private := generator privateKey.



	msg := 1234567890987654321. "the plaintext"

	

c := public crypt: msg. "the ciphertext (print it and take a look)"

	self assert: (private crypt: c) = msg! !

