

!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'ul 3/7/2008 00:52'!

testSHA256

	"these tests come from http://csrc.nist.gov/publications/fips/fips180-2/fips180-2withchangenotice.pdf"



	self assert: (SHA256 hashMessage: 'abc') asInteger = 16rBA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD.

	self assert: (SHA256 hashMessage:  'abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq') asInteger = 16r248D6A61D20638B8E5C026930C3E6039A33CE45964FF2167F6ECEDD419DB06C1.

	SHA256 isPluginAvailable ifTrue: [ "takes a while to run without the plugin"

		self assert: (SHA256 hashMessage: (String new: 1000000 withAll: $a)) asInteger = 16rCDC76E5C9914FB9281A1C7E284D73E67F1809A48A497200E046D39CCC7112CD0 ]! !

