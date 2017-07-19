

!CryptoRijndaelTest methodsFor: 'as yet unclassified' stamp: 'cmm 1/10/2007 21:35'!

testByteArrayPadding

	| paddedHello fullBlockPad needsFullPad |

	paddedHello := #(104 101 108 108 111 11 11 11 11 11 11 11 11 11 11 11 ) asByteArray.

	self assert: paddedHello isProperlyPadded.

	self assert: ('hello' asByteArray padToMultipleOf: 16) = paddedHello.

	self assert: paddedHello unpaddedSize = 'hello' size.



	fullBlockPad := #(16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16) asByteArray.

	self assert: fullBlockPad asByteArray isProperlyPadded.



	needsFullPad := '1234567890123456' asByteArray padToMultipleOf: 16.

	self assert: needsFullPad size = 32.

	self assert: (needsFullPad copyFrom: 17 to: 32) = fullBlockPad.

	self assert: needsFullPad isProperlyPadded.

	self assert: needsFullPad unpaddedSize = 16! !

