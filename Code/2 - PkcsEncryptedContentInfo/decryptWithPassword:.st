

!PkcsEncryptedContentInfo methodsFor: 'api' stamp: 'rww 4/13/2007 22:10'!

decryptWithPassword: password



	| cipher asn1 |

	cipher := self cipherWithPassword: password.

	asn1 := cipher decrypt: self encryptedContent.

	^ ASN1Stream 

		decodeBytes: asn1

		withType: ((ASN1Module name: #pkcs) find: #SafeContents).

! !

