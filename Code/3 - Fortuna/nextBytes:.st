
!Fortuna methodsFor: 'accessing' stamp: 'cmm 4/6/2006 19:13'!
nextBytes: anInteger
	"Generates and answers a ByteArray of size anInteger filled with random data.  This is the #pseudoRandomData: function from p. 166 of Practical Cryptography.  I have renamed it to nextBytes: to be more consistent with Squeaks #nextBits: nomenclature."
	| data |
	(anInteger between: 0 and:  1048576  "2 raisedTo: 20")
		ifFalse:
			[ CryptographyError signal: 'program error, should not generate this much data with the same key.' ].
	data := self generateBlocks: ((anInteger / 16) roundUpTo: 1).
	"Switch to a new key to avoid later compromises of this output."
	self setKey: (self generateBlocks: 2).
	^ data size = anInteger
		ifTrue: [ data ]
		ifFalse: [ data copyFrom: 1 to: anInteger ]! !
