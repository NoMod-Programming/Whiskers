

!RSAEncryptionScheme methodsFor: 'OAEP encoder' stamp: 'len 8/12/2002 14:30'!

encode: message parameter: parameter length: emLen

	| messageLen paddingString pHash  dataBlock seed dbMask maskedDB seedMask maskedSeed em |



	parameter size > (2 raisedTo: 60) ifTrue: 

		[self error: 'parameter string too long'].

	messageLen := message size.

	messageLen > (emLen - (2 * hashLen) - 1) ifTrue: 

		[self error: 'message too long'].



	paddingString := 0 asByteArrayOfSize: (emLen - messageLen - (2*hashLen) - 1).

	pHash := (hash hashMessage: parameter) asByteArrayOfSize: hashLen.

	dataBlock := pHash, paddingString, (ByteArray with: 1), message.



	seed := ByteArray new: hashLen.

	1 to: hashLen do: 

		[:i | seed at: i put: (rand next * 256) floor].

	dbMask := self maskOfLength: (emLen - hashLen) fromString: seed.

	maskedDB := dataBlock bitXor: dbMask.

	seedMask := self maskOfLength: hashLen fromString: maskedDB.

	maskedSeed := seed bitXor: seedMask.

	em := maskedSeed, maskedDB.

	^ em! !

