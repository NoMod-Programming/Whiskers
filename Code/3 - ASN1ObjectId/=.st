

!ASN1ObjectId methodsFor: 'private - parsing' stamp: 'cds 7/5/2010 16:01'!

= anotherOid

	^anotherOid class = self class and: [self oid = anotherOid oid]! !

