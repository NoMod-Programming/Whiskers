

!RSAEncryptionScheme methodsFor: 'encryption scheme' stamp: 'rww 4/11/2004 14:50'!

decrypt: aByteArray

	| m |

	m := privateKey crypt: aByteArray asInteger.

	^ self decode: m asByteArray parameter: encodingParameter.

	



	! !

