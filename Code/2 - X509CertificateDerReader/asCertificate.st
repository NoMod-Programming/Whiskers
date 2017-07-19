

!X509CertificateDerReader methodsFor: 'converting' stamp: 'rww 10/16/2016 20:00'!

asCertificate



	^ X509Certificate fromAsn1DerBytes: self derBytes.

! !

