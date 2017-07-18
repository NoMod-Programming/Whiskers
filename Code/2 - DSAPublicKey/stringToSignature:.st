
!DSAPublicKey methodsFor: 'converting' stamp: 'len 8/15/2002 02:13'!
stringToSignature: aString
	"Answer the signature stored in the given string. A signature string has the format:

		 '[DSA digital signature <r> <s>]'

	where <r> and <s> are large positive integers represented by strings of hexidecimal digits."

	| prefix stream r s |
	prefix := '[DSA digital signature '.
	(aString beginsWith: prefix) ifFalse: [self error: 'bad signature prefix'].
	stream := ReadStream on: aString.
	stream position: prefix size.
	r := Integer readFrom: stream base: 16.
	stream next.
	s := Integer readFrom: stream base: 16.
	^ Array with: r with: s
! !
