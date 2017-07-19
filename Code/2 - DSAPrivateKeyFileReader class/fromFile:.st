

!DSAPrivateKeyFileReader class methodsFor: 'as yet unclassified' stamp: 'rww 9/28/2006 10:08'!

fromFile: filename

	"(DSAPrivateKeyFileReader fromFile: '/usr/local/ssl/private/dsa.key')"

	"(DSAPrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/dsa.key')"



	| fs data |

	fs := StandardFileStream fileNamed: filename.

	data := fs contentsOfEntireFile.

	^ self new initializeFromFileContents: data.

! !

