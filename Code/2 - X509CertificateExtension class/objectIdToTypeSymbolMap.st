

!X509CertificateExtension class methodsFor: 'class initialization' stamp: 'rww 3/29/2007 06:15'!

objectIdToTypeSymbolMap



	| map |

	map := Dictionary new

		at: (ASN1ObjectId fromString: '2.5.29.35') put: #AuthorityKeyIdentifier;

		at: (ASN1ObjectId fromString: '2.5.29.14') put: #KeyIdentifier;

		at: (ASN1ObjectId fromString: '2.5.29.15') put: #KeyUsage;

		at: (ASN1ObjectId fromString: '2.5.29.16') put: #PrivateKeyUsagePeriod;

		at: (ASN1ObjectId fromString: '2.5.29.32') put: #CertificatePolicies;

		at: (ASN1ObjectId fromString: '2.5.29.33') put: #PolicyMappings;

		at: (ASN1ObjectId fromString: '2.5.29.17') put: #SubjectAltName;

		at: (ASN1ObjectId fromString: '2.5.29.18') put: #IssuerAltName;

		at: (ASN1ObjectId fromString: '2.5.29.9') put: #SubjectDirectoryAttributes;

		at: (ASN1ObjectId fromString: '2.5.29.19') put: #BasicConstraints;

		at: (ASN1ObjectId fromString: '2.5.29.30') put: #NameConstraints;

		at: (ASN1ObjectId fromString: '2.5.29.36') put: #PolicyConstraints;

		at: (ASN1ObjectId fromString: '2.5.29.31') put: #CRLDistributionPoints;

		at: (ASN1ObjectId fromString: '2.5.29.37') put: #ExtKeyUsageSyntax;

		at: (ASN1ObjectId fromString: '2.5.29.54') put: #InhibitAnyPolicy;

		at: (ASN1ObjectId fromString: '2.5.29.46') put: #FreshestCRL;

		at: (ASN1ObjectId fromString: '1.3.6.1.5.5.7.1.1') put: #AuthorityInfoAccessSyntax;

		at: (ASN1ObjectId fromString: '1.3.6.1.5.5.7.1.11') put: #SubjectInfoAccessSyntax;

		at: (ASN1ObjectId fromString: '2.5.29.20') put: #CRLNumber;

		at: (ASN1ObjectId fromString: '2.5.29.28') put: #IssuingDistributionPoint;

		at: (ASN1ObjectId fromString: '2.5.29.27') put: #BaseCRLNumber;

		at: (ASN1ObjectId fromString: '2.5.29.21') put: #CRLReason;

		at: (ASN1ObjectId fromString: '2.5.29.29') put: #CertificateIssuer;

		at: (ASN1ObjectId fromString: '2.5.29.23') put: #HoldInstructionCode;

		at: (ASN1ObjectId fromString: '2.5.29.24') put: #InvalidityDate;

		yourself.

	^ map! !

