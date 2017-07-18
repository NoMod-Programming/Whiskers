
!Pkcs8EncryptedPrivateKeyInfo methodsFor: 'api' stamp: 'rww 4/10/2007 18:05'!
cipherWithPassword: password

	| salt iterations keyMaterial ivMaterial cipher |
	salt := self encryptionAlgorithm parameters first.
	iterations := self encryptionAlgorithm parameters last.

	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.1'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 16.
			cipher := ARC4 new key: keyMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.2'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 5.
			cipher := ARC4 new key: keyMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.3'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 24.
			ivMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 2
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 8.
			cipher := TripleDES new key: keyMaterial.
			cipher := cipher cbc initialVector: ivMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.5'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 16.
			ivMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 2
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 8.
			cipher := ARC2 key: keyMaterial effectiveKeyLength: 128.
			cipher := cipher cbc initialVector: ivMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.6'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 5.
			ivMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 2
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 8.
			cipher := ARC2 key: keyMaterial effectiveKeyLength: 40.
			cipher := cipher cbc initialVector: ivMaterial.
			^ cipher].
	^ nil! !
