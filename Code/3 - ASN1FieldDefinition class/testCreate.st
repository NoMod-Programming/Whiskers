
!ASN1FieldDefinition class methodsFor: 'testing' stamp: 'RJT 9/8/2006 15:14'!
testCreate
	^#('version' 'serialNumber' 'signature' 'issuer' 'validity' 'subject' 'subjectPublicKeyInfo' 'issuerUniqueID' 'subjectUniqueID' 'extensions') collect: [:aField | 
	self forField: aField onDefinition: 'TBSCertificate  ::=  SEQUENCE  {
        version         [0]  EXPLICIT Version DEFAULT v1,
        serialNumber         CertificateSerialNumber,
        signature            AlgorithmIdentifier,
        issuer               Name,
        validity             Validity,
        subject              Name,
        subjectPublicKeyInfo SubjectPublicKeyInfo,
        issuerUniqueID  [1]  IMPLICIT UniqueIdentifier OPTIONAL,
                             -- If present, version shall be v2 or v3
        subjectUniqueID [2]  IMPLICIT UniqueIdentifier OPTIONAL,
                             -- If present, version shall be v2 or v3
        extensions      [3]  EXPLICIT Extensions OPTIONAL
                             -- If present, version shall be v3
        }'].! !
