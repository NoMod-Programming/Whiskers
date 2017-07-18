
!PKCS5Or7PaddingMode methodsFor: 'accessing' stamp: 'rww 10/16/2016 22:14'!
encrypt: aByteArray 

	| encryptable |
	encryptable := self isStreamCipher
		ifTrue: [ aByteArray copy ]
		ifFalse: [ aByteArray padToMultipleOf: self blockSize ].
	^ self 
		encrypt: encryptable
		from: 1
		to: encryptable size! !
