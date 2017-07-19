

!Pkcs12PrivateKeyFileReader methodsFor: 'initialize-release' stamp: 'rww 9/28/2010 07:00'!

decodeSafeBag: safeBag



	| asn1 key keyBag cert |

	safeBag bagId oid = '1.2.840.113549.1.12.10.1.1'

		ifTrue: [

			asn1 := ASN1Stream decodeBytes: safeBag bagValue.

			(asn1 at: 1) > 0

				ifTrue: [key := RSAPublicKey exponent: (asn1 at: 3) modulo: (asn1 at: 1)]

				ifFalse: [key := RSAPrivateKey p: (asn1 at: 5) q: (asn1 at: 6) dP: (asn1 at: 7) dQ: (asn1 at: 8) qInv: (asn1 at: 9)].

			self privateKeys add: key.

			^ self].

	safeBag bagId oid = '1.2.840.113549.1.12.10.1.2'

		ifTrue: [

			keyBag := safeBag bagValue decryptWithPassword: self password.

			key := keyBag asPrivateKey.

			self privateKeys add: key.

			^ self].

	safeBag bagId oid = '1.2.840.113549.1.12.10.1.3'

		ifTrue: [

			cert := ASN1Stream 

				decodeBytes: safeBag bagValue certValue 

				withType: ((ASN1Module name: #x509) find: #Certificate).

			self certs add: cert.

			^ self].

	self error: 'unknown safe bag: ', safeBag bagId oid.

! !

