
!BlockCipher methodsFor: 'accessing' stamp: 'cmm 3/3/2006 00:05'!
encrypt: aByteArray 
	"Answer a copy of aByteArray which is encrypted with my key."
	| encryptable |
	encryptable := self isStreamCipher
		ifTrue: [ aByteArray copy ]
		ifFalse: [ aByteArray padToMultipleOf: self blockSize ].
	^ self 
		encrypt: encryptable
		from: 1
		to: encryptable size! !
