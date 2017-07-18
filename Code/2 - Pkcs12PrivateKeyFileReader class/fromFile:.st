
!Pkcs12PrivateKeyFileReader class methodsFor: 'as yet unclassified' stamp: 'rww 4/9/2007 07:47'!
fromFile: filename
	"(Pkcs12PrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/usarhiocertpks12.pfx')"

	| password |
	password := FillInTheBlank requestPassword: 'Enter your password'.
	^ self fromFile: filename password: password.
! !
