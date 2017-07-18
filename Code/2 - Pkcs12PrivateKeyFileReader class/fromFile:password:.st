
!Pkcs12PrivateKeyFileReader class methodsFor: 'as yet unclassified' stamp: 'rww 4/9/2007 07:47'!
fromFile: filename password: aPassword
	"(Pkcs12PrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/usarhiocertpks12.pfx')"

	| fs data |
	fs := StandardFileStream fileNamed: filename.
	data := fs contentsOfEntireFile.
	^ self new
		password: aPassword;
		initializeFromFileContents: data.
! !
