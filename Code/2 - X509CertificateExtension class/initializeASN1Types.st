

!X509CertificateExtension class methodsFor: 'class initialization' stamp: 'rww 3/29/2007 10:18'!

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

		add: #id type: #CertPolicyId;

		addOptional: #qualifiers type: #PolicyQualifierInfos;

		yourself.

	(ASN1Module name: #x509) objectIdentifier: #CertPolicyId.

	(ASN1Module name: #x509) sequence: #PolicyQualifierInfos of: #PolicyQualifierInfo.

	((ASN1Module name: #x509) sequence: #PolicyQualifierInfo mapping: X509PolicyQualifierInfo)

		add: #id type: #ASN1ObjectIdentifierType;

		add: #qualifier type: #ASN1AnyType;

		yourself.



	(ASN1Module name: #x509) sequence: #PolicyMappings of: #PolicyMapping.

	((ASN1Module name: #x509) sequence: #PolicyMapping mapping: X509PolicyMapping)

		add: #issuerDomainPolicy type: #CertPolicyId;

		add: #subjectDomainPolicy type: #CertPolicyId;

		yourself.



	(ASN1Module name: #x509) assign: #SubjectAltName from: #GeneralNames.

	(ASN1Module name: #x509) assign: #IssuerAltName from: #GeneralNames.



	(ASN1Module name: #x509) sequence: #SubjectDirectoryAttributes of: #Attribute.



	((ASN1Module name: #x509) sequence: #BasicConstraints mapping: X509BasicConstraints)

		add: #ca type: #ASN1BooleanType default: false;

		addOptional: #pathLengthConstraint type: #ASN1IntegerType;

		yourself.



	((ASN1Module name: #x509) sequence: #NameConstraints mapping: X509NameConstraints)

		addOptional: #permittedSubtrees type: #GeneralSubtrees implicitTag: 0;

		addOptional: #excludedSubtrees type: #GeneralSubtrees implicitTag: 1;

		yourself.

	(ASN1Module name: #x509) sequence: #GeneralSubtrees of: #GeneralSubtree.

	((ASN1Module name: #x509) sequence: #GeneralSubtree mapping: X509GeneralSubtree)

		add: #base type: #GeneralName;

		add: #minimum type: #BaseDistance implicitTag: 0 default: 0;

		addOptional: #maximum type: #BaseDistance implicitTag: 1;

		yourself.

	(ASN1Module name: #x509) integer: #BaseDistance.



	((ASN1Module name: #x509) sequence: #PolicyConstraints mapping: X509PolicyConstraints)

		addOptional: #requireExplicitPolicy type: #SkipCerts implicitTag: 0;

		addOptional: #inhibitPolicyMapping type: #SkipCerts implicitTag: 1;

		yourself.

	(ASN1Module name: #x509) integer: #SkipCerts.



	(ASN1Module name: #x509) sequence: #CRLDistributionPoints of: #DistributionPoint.

	((ASN1Module name: #x509) sequence: #DistributionPoint mapping: X509DistributionPoint)

		addOptional: #distributionPoint type: #DistributionPointName explicitTag: 0;

		addOptional: #reasons type: #ReasonFlags implicitTag: 1;

		addOptional: #cRLIssuer type: #GeneralNames implicitTag: 2;

		yourself.

	((ASN1Module name: #x509) choice: #DistributionPointName)

		add: #fullName type: #GeneralNames implicitTag: 0;

		add: #nameRelativeToCRLIssuer type: #RelativeDistinguishedName implicitTag: 1;

		yourself.

	(ASN1Module name: #x509) bitString: #ReasonFlags.



	(ASN1Module name: #x509) sequence: #ExtKeyUsageSyntax of: #KeyPurposeId.

	(ASN1Module name: #x509) objectIdentifier: #KeyPurposeId.



	(ASN1Module name: #x509) assign: #InhibitAnyPolicy from: #SkipCerts.



	(ASN1Module name: #x509) assign: #FreshestCRL from: #CRLDistributionPoints.



	(ASN1Module name: #x509) sequence: #AuthorityInfoAccessSyntax of: #AccessDescription.

	((ASN1Module name: #x509) sequence: #AccessDescription mapping: X509AccessDescription)

		add: #accessMethod type: #ASN1ObjectIdentifierType;

		add: #accessLocation type: #GeneralName;

		yourself.



	(ASN1Module name: #x509) sequence: #SubjectInfoAccessSyntax of: #AccessDescription.



	(ASN1Module name: #x509) integer: #CRLNumber.



	((ASN1Module name: #x509) sequence: #IssuingDistributionPoint mapping: X509IssuingDistributionPoint)

		addOptional: #distributionPoint type: #DistributionPointName explicitTag: 0;

		add: #onlyContainsUserCerts type: #ASN1BooleanType implicitTag: 1 default: false;

		add: #onlyContainsCACerts type: #ASN1BooleanType implicitTag: 2 default: false;

		addOptional: #onlySomeReasons type: #ReasonFlags implicitTag: 3;

		add: #indirectCRL type: #ASN1BooleanType implicitTag: 4 default: false;

		add: #onlyContainsAttributeCerts type: #ASN1BooleanType implicitTag: 5 default: false;

		yourself.



	(ASN1Module name: #x509) assign: #BaseCRLNumber from: #CRLNumber.



"	(ASN1Module name: #x509) enumerated: #CRLReason."



	(ASN1Module name: #x509) assign: #CertificateIssuer from: #GeneralNames.



	(ASN1Module name: #x509) objectIdentifier: #HoldInstructionCode.



	(ASN1Module name: #x509) utcTime: #InvalidityDate.

! !

