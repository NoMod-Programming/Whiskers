

!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/5/2006 06:45'!

testLargeSHA1

	"Here is the third example from the specification document (FIPS PUB 180-1). This example may take several minutes."

	self assert: (SHA1 hashMessage: (String new: 1000000 withAll: $a)) asInteger = 16r34AA973CD4C4DAA4F61EEB2BDBAD27316534016F! !

