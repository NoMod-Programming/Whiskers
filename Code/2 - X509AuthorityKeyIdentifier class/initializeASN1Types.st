

!X509AuthorityKeyIdentifier class methodsFor: 'as yet unclassified' stamp: 'rww 3/28/2007 16:23'!

initializeASN1Types



	((ASN1Module name: #x509) sequence: #Certificate mapping: X509Certificate)

		add: #tbsCertificate type: #TBSCertificate;

		add: #signatureAlgorithm type: #AlgorithmIdentifier;

		add: #signature type: #ASN1BitStringType;

		yourself.

	(ASN1Module name: #x509) find: #Certificate.



	((ASN1Module name: #x509) sequence: #TBSCertificate mapping: X509TBSCertificate)

		add: #version type: #Version explicitTag: 0 default: 0;

		add: #serialNumber type: #CertificateSerialNumber;

		add: #signature type: #AlgorithmIdentifier;

		add: #issuer type: #Name;

		add: #validity type: #Validity;

		add: #subject type: #Name;

		add: #subjectPublicKeyInfo type: #SubjectPublicKeyInfo;

		addOptional: #issuerUniqueID type: #UniqueIdentifier implicitTag: 1;

		addOptional: #subjectUniqueID type: #UniqueIdentifier implicitTag: 2;

		addOptional: #extensions type: #Extensions explicitTag: 3;

		yourself.



	((ASN1Module name: #x509) sequence: #AlgorithmIdentifier mapping: X509AlgorithmIdentifier)

		add: #oid type: #ASN1ObjectIdentifierType;

		addOptional: #parameters type: #ASN1AnyType;

		yourself.



	(ASN1Module name: #x509) integer: #Version.

	(ASN1Module name: #x509) integer: #CertificateSerialNumber.

	(ASN1Module name: #x509) bitString: #UniqueIdentifier.

	(ASN1Module name: #x509) sequence: #Extensions of: #Extension.



	((ASN1Module name: #x509) sequence: #Validity mapping: X509Validity)

		add: #notBefore type: #Time;

		add: #notAfter type: #Time;

		yourself.

	(ASN1Module name: #x509) utcTime: #Time.



	((ASN1Module name: #x509) sequence: #AttributeTypeAndValue mapping: X520Attribute)

		add: #attrOid type: #AttributeType;

		add: #attrValue type: #AttributeValue;

		yourself.

	(ASN1Module name: #x509) objectIdentifier: #AttributeType.

	((ASN1Module name: #x509) any: #AttributeValue definedBy: #attrOid)

		at: (ASN1ObjectId fromString: '2.5.4.41') put: #X520Name;

		at: (ASN1ObjectId fromString: '2.5.4.4') put: #X520Name;

		at: (ASN1ObjectId fromString: '2.5.4.42') put: #X520Name;

		at: (ASN1ObjectId fromString: '2.5.4.43') put: #X520Name;

		at: (ASN1ObjectId fromString: '2.5.4.44') put: #X520Name;

		at: (ASN1ObjectId fromString: '2.5.4.3') put: #X520CommonName;

		at: (ASN1ObjectId fromString: '2.5.4.7') put: #X520LocalityName;

		at: (ASN1ObjectId fromString: '2.5.4.8') put: #X520StateOrProvinceName;

		at: (ASN1ObjectId fromString: '2.5.4.10') put: #X520OrganizationName;

		at: (ASN1ObjectId fromString: '2.5.4.11') put: #X520OrganizationalUnitName;

		at: (ASN1ObjectId fromString: '2.5.4.6') put: #X520CountryName;

		at: (ASN1ObjectId fromString: '1.2.840.113549.1.9.1') put: #X520Pkcs9EmailAddress;

		defaultType: #ASN1StringType;

		yourself.

	((ASN1Module name: #x509) choice: #X509StringChoice)

		add: #teletexString type: #ASN1TeletexStringType;

		add: #printableString type: #ASN1PrintableStringType;

		add: #universalString type: #ASN1UniversalStringType;

		add: #utf8String type: #ASN1StringType;

		add: #bmpString type: #ASN1BMPStringType;

		yourself.

	((ASN1Module name: #x509) mapped: #X520Name)

		mapping: X520Name mappingSymbol: #string type: #X509StringChoice.

	((ASN1Module name: #x509) mapped: #X520CommonName)

		mapping: X520CommonName mappingSymbol: #string type: #X509StringChoice.

	((ASN1Module name: #x509) mapped: #X520LocalityName)

		mapping: X520LocalityName mappingSymbol: #string type: #X509StringChoice.

	((ASN1Module name: #x509) mapped: #X520StateOrProvinceName)

		mapping: X520StateOrProvinceName mappingSymbol: #string type: #X509StringChoice.

	((ASN1Module name: #x509) mapped: #X520OrganizationName)

		mapping: X520OrganizationName mappingSymbol: #string type: #X509StringChoice.

	((ASN1Module name: #x509) mapped: #X520OrganizationalUnitName)

		mapping: X520OrganizationalUnitName mappingSymbol: #string type: #X509StringChoice.

	((ASN1Module name: #x509) mapped: #X520CountryName)

		mapping: X520CountryName mappingSymbol: #string type: #ASN1PrintableStringType.

	((ASN1Module name: #x509) mapped: #X520Pkcs9EmailAddress)

		mapping: X520Pkcs9EmailAddress mappingSymbol: #string type: #ASN1IA5StringType.

	



	(ASN1Module name: #x509) set: #RelativeDistinguishedName of: #AttributeTypeAndValue.

	(ASN1Module name: #x509) sequence: #RDNSequence of: #RelativeDistinguishedName.

	((ASN1Module name: #x509) choice: #Name)

		add: #names type: #RDNSequence.



	((ASN1Module name: #x509) sequence: #Extension mapping: X509CertificateExtension)

		add: #extnId type: #ASN1ObjectIdentifierType;

		addOptional: #extnCritical type: #ASN1BooleanType default: false;

		add: #extnValue type: #ASN1ByteArrayType;

		yourself.



	((ASN1Module name: #x509) sequence: #SubjectPublicKeyInfo mapping: X509SubjectPublicKeyInfo)

		add: #algorithm type: #AlgorithmIdentifier;

		add: #subjectPublicKey type: #ASN1BitStringType;

		yourself.



	((ASN1Module name: #x509) sequence: #AuthorityKeyIdentifier mapping: X509AuthorityKeyIdentifier)

		addOptional: #keyIdentifier type: #KeyIdentifier implicitTag: 0;

		addOptional: #certIssuer type: #GeneralNames implicitTag: 0;

		addOptional: #certSerialNumber type: #CertificateSerialNumber implicitTag: 0;

		yourself.



! !

