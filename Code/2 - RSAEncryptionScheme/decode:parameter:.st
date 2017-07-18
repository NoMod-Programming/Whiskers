
!RSAEncryptionScheme methodsFor: 'OAEP encoder' stamp: 'len 8/12/2002 14:28'!
decode: em parameter: parameter
	| emLen maskedSeed maskedDB seedMask seed dbMask dataBlock dbLen pHash pHashPrima i terminado b |
	parameter size > (2 raisedTo: 60) ifTrue: [self error: 'decoding error'].
	emLen := em size.
	emLen < (2 * hashLen + 1) ifTrue: [self error: 'decoding error'].

	maskedSeed := em copyFrom: 1 to: hashLen.
	maskedDB := em copyFrom: (hashLen + 1) to: emLen.
	seedMask := self maskOfLength: hashLen fromString: maskedDB.
	seed := maskedSeed bitXor: seedMask.
	dbMask := self maskOfLength: (emLen - hashLen) fromString: seed.
	dataBlock := maskedDB bitXor: dbMask.
	dbLen := dataBlock size.

	pHash := (hash hashMessage: parameter) asByteArrayOfSize: hashLen.
	pHashPrima := dataBlock copyFrom: 1 to: hashLen.
	i := hashLen + 1.
	terminado := false.
	[terminado] whileFalse: 
		[b := dataBlock at: i.
		b=0 ifTrue: 
			[i := i+1.
			i > dbLen ifTrue: [self error: 'decoding error']]
		ifFalse: 
			[b=1 
				ifTrue: [terminado := true]
				ifFalse: [self error: 'decoding error']
			]
		].
	pHash = pHashPrima ifFalse: [self error: 'decoding error'].
	^ dataBlock copyFrom: i+1 to: dbLen! !
