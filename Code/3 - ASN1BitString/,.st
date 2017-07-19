

!ASN1BitString methodsFor: 'initialize-release' stamp: 'rww 3/27/2007 11:11'!

, bitString



	^ self class new

		bytes: self bytes, bitString bytes;

		bitsPadding: bitString bitsPadding;

		yourself.

! !

