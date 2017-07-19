

!CryptoRigndaelCBCTest methodsFor: 'tests' stamp: 'RobertWithers 10/12/2015 22:43'!

testRFC3602Case4

	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html

	Case #4: Encrypting 64 bytes (4 blocks) using AES-CBC with 128-bit key

	Key       : 0x56e47a38c5598974bc46903dba290349

	IV        : 0x8ce82eefbea0da3c44699ed7db51b7d9

	Plaintext : 0xa0a1a2a3a4a5a6a7a8a9aaabacadaeaf

              b0b1b2b3b4b5b6b7b8b9babbbcbdbebf

              c0c1c2c3c4c5c6c7c8c9cacbcccdcecf

              d0d1d2d3d4d5d6d7d8d9dadbdcdddedf

	Ciphertext: 0xc30e32ffedc0774e6aff6af0869f71aa

              0f3af07a9a31a9c684db207eb0ef8e4e

              35907aa632c3ffdf868bb7b29d3d46ad

              83ce9f9a102ee99d49a53e87f4c3da55

"

	| result |

	result := ((CBC on: (Rijndael new keySize: 16;

					

					key: (ByteArray fromHexString: '16r56e47a38c5598974bc46903dba290349')))

				initialVector: (ByteArray fromHexString: '16r8ce82eefbea0da3c44699ed7db51b7d9'))

				encrypt: (ByteArray fromHexString: '16ra0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedf').

	self assert: result hex = 'c30e32ffedc0774e6aff6af0869f71aa0f3af07a9a31a9c684db207eb0ef8e4e35907aa632c3ffdf868bb7b29d3d46ad83ce9f9a102ee99d49a53e87f4c3da5578b8d04731041aa2d9787ca4a4fa3eef'! !

