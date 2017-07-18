
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 10/5/2006 06:45'!
testMD4
	self assert: (MD4 hashMessage: #(115 0 115 0 110 0) asByteArray) = #(252 63 129 51 180 217 221 240 64 37 167 140 183 214 26 126) asByteArray! !
