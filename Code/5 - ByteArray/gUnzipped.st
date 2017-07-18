
!ByteArray methodsFor: '*cryptography-core' stamp: 'rww 4/29/2016 08:36'!
gUnzipped
	| magic1 magic2 |
	magic1 := self at: 1.
	magic2 := self at: 2.
	(magic1 = 16r1F and:[magic2 = 16r8B]) ifFalse:[^self].
	^(GZipReadStream on: self) upToEnd! !
