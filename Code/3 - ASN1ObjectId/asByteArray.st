
!ASN1ObjectId methodsFor: 'private - parsing' stamp: 'rww 3/25/2007 11:47'!
asByteArray

	| dataStream oidTokens b n lengthStream bytes |
	dataStream := WriteStream on: (ByteArray new: 16).
	oidTokens := self oid tokensBasedOn: $..
	dataStream nextPut: (((oidTokens at: 1) asInteger * 40) + (oidTokens at: 2) asInteger).
	3 to: oidTokens size do: [:i | 
		b := (oidTokens at: i) asInteger.
		(b <= 16r7F)
			ifTrue: [dataStream nextPut: b]
			ifFalse: [
				n := b.
				lengthStream := WriteStream on: (ByteArray new: 4).
				lengthStream nextPut: (n \\ 128).
				[n := n bitShift: -7.
				(n bitShift: -7) = 0] 
					whileFalse: [lengthStream nextPut: ((n \\ 128) bitOr: 16r80)].
				lengthStream nextPut: ((n \\ 128) bitOr: 16r80).
				bytes := lengthStream contents reversed.
				dataStream 
					nextPutAll: bytes ]].
	^ dataStream contents.
! !
