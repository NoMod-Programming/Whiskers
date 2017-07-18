
!RSAPrivateKey class methodsFor: 'instance creation' stamp: 'rww 10/12/2016 21:08'!
initializeASN1Types

	((ASN1Module name: #RSA) sequence: #RSAPrivateKey mapping: RSAPrivateKey)
 		add: #version type: #Version explicitTag: 0 default: 0;
		add: #n type: #Modulus;
		add: #e type: #PublicExponent;
		add: #d type: #PrivateExponent;
		add: #p type: #Prime1;
		add: #q type: #Prime2;
		add: #dP type: #Exponent1;
		add: #dQ type: #Exponent2;
		add: #qInv type: #Coefficient;
		addOptional: #otherPrimeInfos type: #OtherPrimeInfos explicitTag: 1; "explicitTag: 3"
		yourself.

	(ASN1Module name: #RSA) find: #RSAPrivateKey.

	(ASN1Module name: #RSA) integer: #Version.
	(ASN1Module name: #RSA) integer: #Modulus.
	(ASN1Module name: #RSA) integer: #PublicExponent.
	(ASN1Module name: #RSA) integer: #PrivateExponent.
	(ASN1Module name: #RSA) integer: #Prime1.
	(ASN1Module name: #RSA) integer: #Prime2.
	(ASN1Module name: #RSA) integer: #Exponent1.
	(ASN1Module name: #RSA) integer: #Exponent2.
	(ASN1Module name: #RSA) integer: #Coefficient.
	(ASN1Module name: #RSA) bitString: #OtherPrimeInfos.
! !
