

!CryptoElGamalTest methodsFor: 'ElGamal' stamp: 'rww 10/5/2006 06:47'!

elGamalGeneratorOfSize: bits

	^ elGamalGenerators 

		at: bits

		ifAbsent:

			[ "We should at least run the generator code to be sure it gets tested."

			ElGamalKeyGenerator new generateKeysOfSize: bits ]! !

