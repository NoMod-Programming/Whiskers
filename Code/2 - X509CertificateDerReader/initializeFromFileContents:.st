
!X509CertificateDerReader methodsFor: 'initialize-release' stamp: 'rww 1/22/2007 18:37'!
initializeFromFileContents: data

	| i j theData |
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 
		ifTrue: [theData := data reject: [:c | (c = $-) or: [c isSeparator]]]
		ifFalse: [
			i := data indexOfSubCollection: 'CERTIFICATE--' startingAt: i.
			j := data indexOfSubCollection: '--END ' startingAt: i.
			i := data findAnySubStr: String crlf startingAt: i.
			theData := (data copyFrom: i to: j)
				reject: [:c | (c = $-) or: [c isSeparator]]].
	theData := (Base64MimeConverter mimeDecodeToBytes: theData readStream) contents.
	self derBytes: theData.
! !
