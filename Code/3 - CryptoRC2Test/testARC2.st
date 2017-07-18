
!CryptoRC2Test methodsFor: 'testing' stamp: 'RJT 4/6/2007 09:53'!
testARC2
	" All quantities are given in hexadecimal notation.

   Key length (bytes) = 8
   Effective key length (bits) = 63
   Key = 00000000 00000000
   Plaintext = 00000000 00000000
   Ciphertext = ebb773f9 93278eff "
	
	self genericARC2TestKey: (ByteArray fromHexString: '00000000 00000000') effectiveKeyLength: 63 plaintext: (ByteArray fromHexString: '00000000 00000000') ciphertext: (ByteArray fromHexString: 'ebb773f9 93278eff').

   "Key length (bytes) = 8
   Effective key length (bits) = 64
   Key = ffffffff ffffffff
   Plaintext = ffffffff ffffffff
   Ciphertext = 278b27e4 2e2f0d49"

	self genericARC2TestKey: (ByteArray fromHexString: 'ffffffff ffffffff') effectiveKeyLength: 64 plaintext: (ByteArray fromHexString: 'ffffffff ffffffff') ciphertext: (ByteArray fromHexString: '278b27e4 2e2f0d49').
  
   "Key length (bytes) = 8
   Effective key length (bits) = 64
   Key = 30000000 00000000
   Plaintext = 10000000 00000001
   Ciphertext = 30649edf 9be7d2c2"

	self genericARC2TestKey: (ByteArray fromHexString: '30000000 00000000') effectiveKeyLength: 64 plaintext: (ByteArray fromHexString: '10000000 00000001') ciphertext: (ByteArray fromHexString: '30649edf 9be7d2c2').

   "Key length (bytes) = 1
   Effective key length (bits) = 64
   Key = 88
   Plaintext = 00000000 00000000
   Ciphertext = 61a8a244 adacccf0"

	self genericARC2TestKey: (ByteArray fromHexString: '88') effectiveKeyLength: 64 plaintext: (ByteArray fromHexString: '00000000 00000000') ciphertext: (ByteArray fromHexString: '61a8a244 adacccf0').

   "Key length (bytes) = 7
   Effective key length (bits) = 64
   Key = 88bca90e 90875a
   Plaintext = 00000000 00000000
   Ciphertext = 6ccf4308 974c267f"

	self genericARC2TestKey: (ByteArray fromHexString: '88bca90e 90875a') effectiveKeyLength: 64 plaintext: (ByteArray fromHexString: '00000000 00000000') ciphertext: (ByteArray fromHexString: '6ccf4308 974c267f').

   "Key length (bytes) = 16
   Effective key length (bits) = 64
   Key = 88bca90e 90875a7f 0f79c384 627bafb2
   Plaintext = 00000000 00000000
   Ciphertext = 1a807d27 2bbe5db1"

	self genericARC2TestKey: (ByteArray fromHexString: '88bca90e 90875a7f 0f79c384 627bafb2') effectiveKeyLength: 64 plaintext: (ByteArray fromHexString: '00000000 00000000') ciphertext: (ByteArray fromHexString: '1a807d27 2bbe5db1').

   "Key length (bytes) = 16
   Effective key length (bits) = 128
   Key = 88bca90e 90875a7f 0f79c384 627bafb2
   Plaintext = 00000000 00000000
   Ciphertext = 2269552a b0f85ca6"

	self genericARC2TestKey: (ByteArray fromHexString: '88bca90e 90875a7f 0f79c384 627bafb2') effectiveKeyLength: 128 plaintext: (ByteArray fromHexString: '00000000 00000000') ciphertext: (ByteArray fromHexString: '2269552a b0f85ca6').

   "Key length (bytes) = 33
   Effective key length (bits) = 129
   Key = 88bca90e 90875a7f 0f79c384 627bafb2 16f80a6f 85920584
         c42fceb0 be255daf 1e
   Plaintext = 00000000 00000000
   Ciphertext = 5b78d3a4 3dfff1f1"

	self genericARC2TestKey: (ByteArray fromHexString: '88bca90e 90875a7f 0f79c384 627bafb2 16f80a6f 85920584 c42fceb0 be255daf 1e') effectiveKeyLength: 129 plaintext: (ByteArray fromHexString: '00000000 00000000') ciphertext: (ByteArray fromHexString: '5b78d3a4 3dfff1f1').! !
