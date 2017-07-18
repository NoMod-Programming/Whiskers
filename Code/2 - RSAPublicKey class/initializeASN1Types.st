
!RSAPublicKey class methodsFor: 'instance creation' stamp: 'rww 10/12/2016 04:01'!
initializeASN1Types

	((ASN1Module name: #RSA) sequence: #RSAPublicKey mapping: RSAPublicKey)
		add: #modulo type: #Modulus; "n"
		add: #exponent type: #PublicExponent; "e"
		yourself.

	(ASN1Module name: #RSA) find: #RSAPublicKey.

	(ASN1Module name: #RSA) integer: #Modulus.
	(ASN1Module name: #RSA) integer: #PublicExponent.
! !
