
!DSAPrivateKeyFileReader methodsFor: 'initialization' stamp: 'rww 9/27/2006 21:28'!
processDEKInfo: data

	| stream algorithm |
	stream := data readStream.
	stream upTo: $:.
	algorithm := (stream upTo: $,) withBlanksTrimmed.
	self iv: (Integer readFrom: stream base: 16) asByteArray.
! !
