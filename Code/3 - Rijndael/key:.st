

!Rijndael methodsFor: 'accessing' stamp: 'len 8/9/2002 13:30'!

key: aByteArray

"	nK := aByteArray size * 8 / 32."

	self setSystem.

	self expandKey: aByteArray.

	self eqExpandKey! !

