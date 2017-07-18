
!RSAPrivateKeyFileReader methodsFor: 'initialization' stamp: 'rww 9/26/2006 15:53'!
processDEKInfo: data

	| stream algorithm |
	stream := data readStream.
	stream upTo: $:.
	algorithm := (stream upTo: $,) withBlanksTrimmed.
	self iv: (Integer readFrom: stream base: 16) asByteArray.
! !
