
!SmallInteger methodsFor: '*cryptography-core' stamp: 'rww 12/22/2015 06:42'!
sizeAsFourBytes

	| byteStream |
	byteStream := (ByteArray new: 4) writeStream.
	1 to: 4 do: [ :byteIndex | byteStream nextPut: (self digitAt: 4 + 1 - byteIndex) ].
	^ byteStream contents
! !
