
!RSAPublicKeyFileReader methodsFor: 'initialize-release' stamp: 'rww 9/23/2010 03:48'!
initializeFromFileContents: data

	| i j theData |
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 ifTrue: [self derBytes: data asByteArray. ^ self].
	i := data indexOfSubCollection: 'KEY--' startingAt: i.
	i := data findAnySubStr: String crlf startingAt: i.
	j := data findAnySubStr: String crlf startingAt: i + 1.
"	self processProcType: (data copyFrom: i + 1 to: j)."
	i := j.
	j := data findAnySubStr: String crlf startingAt: i + 1.
"	self processDEKInfo: (data copyFrom: i + 1 to: j)."
	i := j.
	j := data indexOfSubCollection: '--END ' startingAt: i.
	theData := (data copyFrom: i to: j)
		reject: [:c | (c = $-) or: [c isSeparator]].
	theData := (Base64MimeConverter mimeDecodeToBytes: theData readStream) contents.
	self bytes: theData.
! !
