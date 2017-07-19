

!X509Certificate class methodsFor: 'instance creation' stamp: 'rww 10/16/2016 20:02'!

fromFile: filename



	| fs data i j |

	fs := StandardFileStream readOnlyFileNamed: filename.

	data := fs contentsOfEntireFile.

	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.

	i = 0 ifTrue: [^ self fromAsn1DerBytes: data asByteArray].

	i := data indexOfSubCollection: 'CERTIFICATE--' startingAt: i.

	j := data indexOfSubCollection: '--END ' startingAt: i.

	i := data findAnySubStr: String crlf startingAt: i.

	data := (data copyFrom: i to: j)

		reject: [:c | (c = $-) or: [c isSeparator]].

	data := data base64Encoded.

	^ self fromAsn1DerBytes: data.

! !

