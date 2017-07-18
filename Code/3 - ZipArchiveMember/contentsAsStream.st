
!ZipArchiveMember methodsFor: 'reading' stamp: 'EMP 7/16/2017 14:56'!
contentsAsStream
	"Answer my contents as a read stream - assuming a Latin1 encoding."
	| s |
	s := (ByteArray new: self uncompressedSize) writeStream.
	self extractTo: s.
	^ReadStream on: (s contents asString)! !
