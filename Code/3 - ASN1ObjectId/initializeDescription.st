
!ASN1ObjectId methodsFor: 'private - parsing' stamp: 'rww 1/1/2003 15:09'!
initializeDescription


"	oid := 'x', self getOID.
	ix := 1.
	[ix < oid size]
		whileTrue: [
			((oid at: ix) = $.)
				ifTrue: [oid at: ix put: $x].
			ix := ix + 1.
		].
	(ASN1ObjectIdentifiers includesKey: oid asSymbol)
		ifTrue: [^ASN1ObjectIdentifiers at: oid asSymbol]
		ifFalse: [^self getOID]"! !
