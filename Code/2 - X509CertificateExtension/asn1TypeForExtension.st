
!X509CertificateExtension methodsFor: 'private' stamp: 'rww 3/28/2007 17:27'!
asn1TypeForExtension
	"
		id-ce = 2.5.29
		id-pe = 1.3.6.1.5.5.7.1
		id-qt = 1.3.6.1.5.5.7.2
		id-kp = 1.3.6.1.5.5.7.3
		id-ad = 1.3.6.1.5.5.7.48
	"
	
	| typeSymbol |
	typeSymbol := self class objectIdToTypeSymbolMap at: self extnId ifAbsent: [^nil].
	^ (ASN1Module name: #x509) find: typeSymbol.
	! !
