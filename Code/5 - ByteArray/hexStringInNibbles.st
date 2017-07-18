
!ByteArray methodsFor: '*cryptography-core' stamp: 'rww 1/12/2003 22:08'!
hexStringInNibbles


	^ (self  
		inject: String new writeStream
		into: [:stream :byte |
			stream
				nextPut: ('0123456789ABCDEF' at: byte // 16 + 1);
				nextPut: ('0123456789ABCDEF' at: byte \\ 16 + 1);
				nextPut: Character space.  
			stream]) contents.
! !
