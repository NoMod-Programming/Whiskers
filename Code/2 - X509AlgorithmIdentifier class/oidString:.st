
!X509AlgorithmIdentifier class methodsFor: 'instance creation' stamp: 'rww 4/27/2007 14:36'!
oidString: oidString

	^ self oid: (ASN1ObjectId fromString: oidString).
! !
