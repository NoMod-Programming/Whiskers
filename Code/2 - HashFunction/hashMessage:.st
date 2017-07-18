
!HashFunction methodsFor: 'accessing' stamp: 'len 8/7/2002 16:30'!
hashMessage: aStringOrByteArray
	"MD5 new hashMessage: 'foo'"
	^ self hashStream: aStringOrByteArray asByteArray readStream! !
