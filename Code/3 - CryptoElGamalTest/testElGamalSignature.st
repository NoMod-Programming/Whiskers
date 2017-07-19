

!CryptoElGamalTest methodsFor: 'ElGamal' stamp: 'rww 10/5/2006 06:48'!

testElGamalSignature

	self elGamalSizes do: [:eachBits | self performElGamalSignature: eachBits]! !

