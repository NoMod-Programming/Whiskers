
!HashFunction methodsFor: 'accessing' stamp: 'cmm 2/20/2006 23:22'!
doubleHashMessage: aStringOrByteArray
	"SHA1 new doubleHashMessage: 'foo'"
	^ self doubleHashStream: aStringOrByteArray asByteArray readStream! !
