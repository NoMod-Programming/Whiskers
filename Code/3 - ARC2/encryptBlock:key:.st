

!ARC2 methodsFor: 'encryption/decryption' stamp: 'RJT 4/6/2007 14:45'!

encryptBlock: plainText key: expandedKeys

	"The entire encryption operation can now be described as follows. Here

   j is a global integer variable which is affected by the mixing

   operations.

        1. Initialize words R[0], ..., R[3] to contain the

           64-bit input value.

        2. Expand the key, so that words K[0], ..., K[63] become

           defined.

        3. Initialize j to zero.

        4. Perform five mixing rounds.

        5. Perform one mashing round.

        6. Perform six mixing rounds.

        7. Perform one mashing round.

        8. Perform five mixing rounds."



	| cText rStream result |

	self j: 0.

	cText := plainText.

	rStream := cText readStream.

	result := ByteArray new.

	[rStream atEnd] whileFalse: [

		result := result , ((rStream nextLittleEndianNumber: 2) asByteArrayOfSize:2)

	].

	cText := result.

	1 to: 5 do: [:i |

		cText := self mixUp: cText withKeys: expandedKeys

	].

	cText := self mash: cText withKeys: expandedKeys.

	1 to: 6 do: [:i |

		cText := self mixUp: cText withKeys: expandedKeys

	].

	cText := self mash: cText withKeys: expandedKeys.

	1 to: 5 do: [:i |

		cText := self mixUp: cText withKeys: expandedKeys

	].

	rStream := cText readStream.

	result := ByteArray new.

	[rStream atEnd] whileFalse: [

		result := result , ((rStream nextLittleEndianNumber: 2) asByteArrayOfSize: 2)

	].

	^result

		! !

