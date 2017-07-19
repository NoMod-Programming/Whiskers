

!X509BasicConstraints class methodsFor: 'class initialization' stamp: 'rww 3/28/2007 19:36'!

initializeASN1Types



	((ASN1Module name: #x509) sequence: #AuthorityKeyIdentifier mapping: X509AuthorityKeyIdentifier)

		addOptional: #keyIdentifier type: #KeyIdentifier implicitTag: 0;

		addOptional: #certIssuer type: #GeneralNames implicitTag: 1;

		addOptional: #certSerialNumber type: #CertificateSerialNumber implicitTag: 2;

		yourself.

	(ASN1Module name: #x509) byteArray: #KeyIdentifier.



	(ASN1Module name: #x509) sequence: #GeneralNames of: #GeneralName.

	((ASN1Module name: #x509) choice: #GeneralName)

		add: #otherName type: #AnotherName implicitTag: 0;

		add: #rfc822Name type: #ASN1IA5StringType implicitTag: 1;

		add: #dNSName type: #ASN1IA5StringType implicitTag: 2;

"		add: #x400Address type: #ORAddress implicitTag: 3;"

		add: #directoryName type: #Name explicitTag: 4;

		add: #ediPartyName type: #EDIPartyName implicitTag: 5;

		add: #uniformResourceIdenifier type: #ASN1IA5StringType implicitTag: 6;

		add: #iPAddress type: #ASN1ByteArrayType implicitTag: 7;

		add: #registeredID type: #ASN1ObjectIdentifierType implicitTag: 8;

		yourself.

	((ASN1Module name: #x509) sequence: #AnotherName mapping: X509AnotherName)

		add: #typeId type: #ASN1ObjectIdentifierType;

		add: #value type: #ASN1AnyType explicitTag: 0;

		yourself.

	((ASN1Module name: #x509) sequence: #EDIPartyName mapping: X509EDIPartyName)

		addOptional: #nameAssigner type: #X509StringChoice implicitTag: 0;

		add: #partyName type: #X509StringChoice implicitTag: 1;

		yourself.



	(ASN1Module name: #x509) bitString: #KeyUsage.



	((ASN1Module name: #x509) sequence: #PrivateKeyUsagePeriod mapping: X509Validity)

		addOptional: #notBefore type: #ASN1UTCTimeType implicitTag: 0;

		addOptional: #notAfter type: #ASN1UTCTimeType implicitTag: 1;

		yourself.



	(ASN1Module name: #x509) sequence: #CertificatePolicies of: #PolicyInformation.

	((ASN1Module name: #x509) sequence: #PolicyInformation mapping: X509PolicyInformation)

		add: #id type: #ASN1ObjectIdentifierType;

		addOptional: #qualifiers type: #PolicyQualifierInfos;

		yourself.

	(ASN1Module name: #x509) sequence: #PolicyQualifierInfos of: #PolicyQualifierInfo.

	((ASN1Module name: #x509) sequence: #PolicyQualifierInfo mapping: X509PolicyQualifierInfo)

		add: #id type: #ASN1ObjectIdentifierType;

		add: #qualifier type: #ASN1AnyType;

		yourself.



	(ASN1Module name: #x509) sequence: #PolicyMappings of: #PolicyMapping.

	((ASN1Module name: #x509) sequence: #PolicyMapping mapping: X509PolicyMapping)

		add: #issuerDomainPolicy type: #ASN1ObjectIdentifierType;

		add: #subjectDomainPolicy type: #ASN1ObjectIdentifierType;

		yourself.



	(ASN1Module name: #x509) sequence: #SubjectDirectoryAttributes of: #Attribute.



	((ASN1Module name: #x509) sequence: #BasicConstraints mapping: X509BasicConstraints)

		add: #ca type: #ASN1BooleanType default: false;

		addOptional: #pathLengthConstraint type: #ASN1IntegerType;

		yourself.



"

#NameConstraints

#PolicyConstraints

#CRLDistributionPoints

#ExtKeyUsageSyntax

#InhibitAnyPolicy

#FreshestCRL

#AuthorityInfoAccessSyntax

#SubjectInfoAccessSyntax

#CRLNumber

#IssuingDistributionPoint

#BaseCRLNumber

#CRLReason

#BaseCRLNumber

#CertificateIssuer

#HoldInstructionCode

#InvalidityDate

"! !

