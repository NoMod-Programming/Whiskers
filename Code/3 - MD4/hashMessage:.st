

!MD4 methodsFor: 'accessing' stamp: 'len 10/16/2002 16:28'!

hashMessage: aStringOrByteArray

	self input: aStringOrByteArray asByteArray.

	self run.

	^ self output! !

