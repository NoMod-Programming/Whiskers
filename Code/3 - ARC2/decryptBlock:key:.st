
!ARC2 methodsFor: 'encryption/decryption' stamp: 'RJT 4/6/2007 14:47'!
decryptBlock: plainText key: expandedKeys
	"The entire decryption operation can now be described as follows.
   Here j is a global integer variable which is affected by the mixing
   operations.

        1. Initialize words R[0], ..., R[3] to contain the 64-bit
           ciphertext value.
        2. Expand the key, so that words K[0], ..., K[63] become
           defined.
        3. Initialize j to 63.
        4. Perform five r-mixing rounds.
        5. Perform one r-mashing round.
        6. Perform six r-mixing rounds.
        7. Perform one r-mashing round.
        8. Perform five r-mixing rounds."

	| cText rStream result |
	self j: 63.
	cText := plainText.
	rStream := cText readStream.
	result := ByteArray new.
	[rStream atEnd] whileFalse: [
		result := result , ((rStream nextLittleEndianNumber: 2) asByteArrayOfSize: 2)
	].
	cText := result.
	1 to: 5 do: [:i |
		cText := self rMixUp: cText withKeys: expandedKeys
	].
	cText := self rMash: cText withKeys: expandedKeys.
	1 to: 6 do: [:i |
		cText := self rMixUp: cText withKeys: expandedKeys
	].
	cText := self rMash: cText withKeys: expandedKeys.
	1 to: 5 do: [:i |
		cText := self rMixUp: cText withKeys: expandedKeys
	].
	rStream := cText readStream.
	result := ByteArray new.
	[rStream atEnd] whileFalse: [
		result := result , ((rStream nextLittleEndianNumber: 2) asByteArrayOfSize: 2)
	].
	^result 
		! !
