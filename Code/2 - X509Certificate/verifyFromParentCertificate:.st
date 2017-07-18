
!X509Certificate methodsFor: 'verifying' stamp: 'rww 4/28/2007 19:33'!
verifyFromParentCertificate: parentCert

	(DateAndTime now 
		between: self tbsCertificate validity notBefore
		and: self tbsCertificate validity notAfter)
			ifFalse: [^ false].
	self tbsCertificate issuer = parentCert tbsCertificate subject
		ifFalse: [^ false].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.2')
		ifTrue: [^ self verifyMD2WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.4')
		ifTrue: [^ self verifyMD5WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.5')
		ifTrue: [^ self verifySHA1WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.10040.4.3')
		ifTrue: [^ self verifySHA1WithDSAEncryptionFromParentCertificate: parentCert].
	^ false.
! !
