
!ByteArray methodsFor: '*cryptography-core' stamp: 'rww 4/29/2016 08:36'!
gZipped
	| stream gzstream |
	stream := (ByteArray new: self size // 5) writeStream.
	gzstream := GZipWriteStream on: stream.
	gzstream nextPutAll: self.
	gzstream close.
	^stream contents! !
