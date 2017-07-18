
!ReadStream methodsFor: '*Cryptography-ASN1' stamp: 'RJT 9/1/2006 17:19'!
formatASN1TabLevel: aTabLevel 
	| result tag aString size tabs sizeAndBytes bytes |
	self atEnd
		ifTrue: [^ String new].
	tabs := ((1 to: aTabLevel)
				collect: [:i | '.' , String tab]) merge.
	result := tabs , (tag := self next) , String tab.
	sizeAndBytes := tag = '00'
				ifTrue: [(Number readFrom: (bytes := self next: 2) merge asUppercase base: 16) -> bytes merge]
				ifFalse: [Integer asnDerLengthFromHexStreamWithBytes: self].
	size := sizeAndBytes key.
	aString := (self next: size) merge.
	aString isEmpty
		ifTrue: [aString := String new].
	(tag = '30'
			or: [tag = '31'
					or: [tag first asLowercase = $a or: [tag = '00']]])
		ifTrue: [result := result , sizeAndBytes value , ' (' , size asString , '): ' , String cr
						, (aString formatASN1TabLevel: aTabLevel + 1)]
		ifFalse: [result := result , sizeAndBytes value , ' (' , size asString , '): ' , String cr , tabs , String tab , aString , String cr
						, (self formatASN1TabLevel: aTabLevel)].
	^ result
		, (self formatASN1TabLevel: aTabLevel)! !
