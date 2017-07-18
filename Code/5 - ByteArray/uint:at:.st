
!ByteArray methodsFor: '*cryptography-core' stamp: 'cmm 2/23/2006 22:59'!
uint: bits at: anInteger

	| answer bytes |
	bits == 64 ifTrue: [ ^ self unsigned64At: anInteger ].
	bits == 56 ifTrue: [ ^ self unsigned56At: anInteger ].
	bits == 48 ifTrue: [ ^ self unsigned48At: anInteger ].
	bits == 40 ifTrue: [ ^ self unsigned40At: anInteger ].
	bits == 32
		ifTrue:
			[ ^ self
				unsignedLongAt: anInteger
				bigEndian: false ].
	bits == 16
		ifTrue:
			[ ^ self
				unsignedShortAt: anInteger
				bigEndian: false ].
	bits == 8 
		ifTrue:
			[ ^ self byteAt: anInteger ].
	bytes := bits // 8.
	answer := LargePositiveInteger new: bytes.
	1 to: bytes do:
		[ :digitPosition |
		answer
			digitAt: digitPosition
			put: (self at: digitPosition + anInteger - 1) ].
	^answer normalize! !
