
!Pkcs12PrivateKeyFileReader methodsFor: 'initialize-release' stamp: 'rww 4/13/2007 22:10'!
initializeFromFileContents: data

	| authSafe |
	self pfx: (ASN1Stream 
		decodeBytes: data asByteArray
		withType: ((ASN1Module name: #pkcs) find: #PFX)).
	self validatePFXMAC.
	authSafe := ASN1Stream 
		decodeBytes: self pfx authSafe content 
		withType: ((ASN1Module name: #pkcs) find: #AuthenticatedSafe).
	authSafe do: [:eachContentInfo | self decodeContentInfo: eachContentInfo].
	self password: nil.! !
