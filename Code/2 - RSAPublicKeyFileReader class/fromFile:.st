

!RSAPublicKeyFileReader class methodsFor: 'instance creation' stamp: 'rww 9/23/2010 03:45'!

fromFile: filename

	"(RSAPrivateKeyFileReader fromFile: '/usr/local/ssl/private/CA.key')"

	"(RSAPrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/rsa.key')"



	| fs data |

	fs := StandardFileStream fileNamed: filename.

	data := fs contentsOfEntireFile.

	^ self new initializeFromFileContents: data.

! !

