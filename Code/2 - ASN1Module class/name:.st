

!ASN1Module class methodsFor: 'instance creation' stamp: 'rww 3/23/2007 13:45'!

name: aSymbol

	"ASN1Module name: #x509"



	| mod |

	^ self modules

		at: aSymbol

		ifAbsent: [

			mod := self new

				name: aSymbol;

				yourself.

			self modules at: mod name put: mod.

			mod].

! !

