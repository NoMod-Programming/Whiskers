

!X509AlgorithmIdentifier class methodsFor: 'instance creation' stamp: 'rww 4/20/2007 09:43'!

oidString: oidString parameters: params



	^ self oid: (ASN1ObjectId fromString: oidString) parameters: params.

! !

