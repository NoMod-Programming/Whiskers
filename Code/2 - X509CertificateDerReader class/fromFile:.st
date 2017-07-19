

!X509CertificateDerReader class methodsFor: 'instance creation' stamp: 'rww 1/22/2007 10:03'!

fromFile: filename

	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/rsa.cert') asCertificate"

	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/dsa.cert') asCertificate"

	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/class3cacert.crt') asCertificate"

	"(X509CertificateDerReader fromFile: '/Users/slosher/Desktop/squeak/certificates/class1cacert.crt') asCertificate"



	| fs data |

	fs := StandardFileStream fileNamed: filename.

	data := fs contentsOfEntireFile.

	^ self new initializeFromFileContents: data.

! !

