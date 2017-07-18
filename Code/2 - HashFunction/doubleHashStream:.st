
!HashFunction methodsFor: 'accessing' stamp: 'cmm 2/20/2006 23:21'!
doubleHashStream: aStream
	^ self hashStream: ((self hashStream: aStream) asByteArray readStream)! !
