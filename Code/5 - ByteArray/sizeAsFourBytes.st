
!ByteArray methodsFor: '*cryptography-core' stamp: 'rww 12/18/2015 00:21'!
sizeAsFourBytes

	| byteStream |
	byteStream := (ByteArray new: 4) writeStream.
	1 to: 4 do: [ :byteIndex | byteStream nextPut: (self size digitAt: 4 + 1 - byteIndex) ].
	^ byteStream contents
! !
