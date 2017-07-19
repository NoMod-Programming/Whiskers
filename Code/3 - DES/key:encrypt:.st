

!DES methodsFor: 'private' stamp: 'hmm 10/2/2006 21:52'!

key: aByteArray encrypt: aBoolean

	encrypting := aBoolean.

	self primPluginAvailable ifFalse: [^self].

	aByteArray size = 8 ifFalse: [self error: 'DES key must be 8 bytes'].

	cookedKey := WordArray new: 32.

	cookedKey atAllPut: 0.

	self primCookKey: aByteArray mode: (aBoolean ifTrue: [1] ifFalse:

[0]) to: cookedKey! !

