
!CryptoElGamalTest methodsFor: 'ElGamal' stamp: 'rww 10/5/2006 06:47'!
testElGamalEncryption
	self elGamalSizes do: [:eachBits | self performElGamalEncryption: eachBits]! !
