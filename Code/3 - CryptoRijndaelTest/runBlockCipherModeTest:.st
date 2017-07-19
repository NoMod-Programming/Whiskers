

!CryptoRijndaelTest methodsFor: 'block ciphers' stamp: 'cmm 12/15/2006 19:27'!

runBlockCipherModeTest: cipherModeSelector

	| key encipherer decipherer startMsg |

	key := #(190 219 189 251 27 38 8 9 135 25 167 8 238 107 29 251 136 65 107 0 37 215 45 130 84 87 13 206 8 55 74 82) asByteArray.

	encipherer := (Rijndael key: key) perform: cipherModeSelector.  

	decipherer := (Rijndael key: key) perform: cipherModeSelector.

	"Stream ciphers do not require padding, therefore blocks can be less than the encipherer's blockSize."

	startMsg := encipherer isStreamCipher ifTrue: [ 900 ] ifFalse: [ 1000 ].

	startMsg to: 1200 do:

		[ : n |  | block originalBlock iv |

		block := ('some message', n printString) asByteArray.

		iv := ByteArray new: Rijndael blockSize.

		iv uint: Rijndael blockSize*8 at: 1 put: n.

		encipherer initialVector: iv copy.

		decipherer initialVector: iv copy.

		originalBlock := block copy.

		encipherer encryptBlock: block.

		self deny: block = originalBlock.

		self assert: block size = originalBlock size.

		decipherer decryptBlock: block.

		self assert: block = originalBlock ]! !

