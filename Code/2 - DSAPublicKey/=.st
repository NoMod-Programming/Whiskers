

!DSAPublicKey methodsFor: 'comparing' stamp: 'rww 10/16/2016 19:26'!

= anObject



	(anObject isKindOf: self class) ifFalse: [^false].

	^ self asAsn1DerBytes = anObject asAsn1DerBytes! !

