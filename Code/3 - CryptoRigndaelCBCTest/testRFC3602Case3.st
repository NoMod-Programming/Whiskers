

!CryptoRigndaelCBCTest methodsFor: 'tests' stamp: 'RobertWithers 10/12/2015 22:40'!

testRFC3602Case3

	"this test comes from RFC3602 http://www.faqs.org/rfcs/rfc3602.html

	Case #3: Encrypting 48 bytes (3 blocks) using AES-CBC with 128-bit key

	Key : 0x6c3ea0477630ce21a2ce334aa746c2cd

	IV : 0xc782dc4c098c66cbd9cd27d825682c81

	Plaintext : This is a 48-byte message (exactly 3 AES blocks)

	Ciphertext: 0xd0a02b3836451753d493665d33f0e886

	2dea54cdb293abc7506939276772f8d5

	021c19216bad525c8579695d83ba2684"

	| result |

	result := ((CBC on: (Rijndael new keySize: 16;

					

					key: (ByteArray fromHexString: '16r6c3ea0477630ce21a2ce334aa746c2cd')))

				initialVector: (ByteArray fromHexString: '16rc782dc4c098c66cbd9cd27d825682c81'))

				encrypt: 'This is a 48-byte message (exactly 3 AES blocks)' asByteArray.

	self assert: result hex = 'd0a02b3836451753d493665d33f0e8862dea54cdb293abc7506939276772f8d5021c19216bad525c8579695d83ba2684d248b3e0f2388c137102846eb06272ff'! !

