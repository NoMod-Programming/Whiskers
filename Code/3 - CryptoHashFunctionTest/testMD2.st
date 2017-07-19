

!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'rww 1/23/2007 19:10'!

testMD2

	self assert: (MD2 hashMessage: '') asInteger = 16r8350E5A3E24C153DF2275C9F80692773.

	self assert: (MD2 hashMessage: 'a') asInteger = 16r32EC01EC4A6DAC72C0AB96FB34C0B5D1.

	self assert: (MD2 hashMessage: 'abc') asInteger = 16rDA853B0D3F88D99B30283A69E6DED6BB.

	self assert: (MD2 hashMessage: 'message digest') asInteger = 16rAB4F496BFB2A530B219FF33031FE06B0.

	self assert: (MD2 hashMessage: 'abcdefghijklmnopqrstuvwxyz') asInteger  = 16r4E8DDFF3650292AB5A4108C3AA47940B.

	self assert: (MD2 hashMessage: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') asInteger = 16rDA33DEF2A42DF13975352846C30338CD.

	self assert: (MD2 hashMessage: '12345678901234567890123456789012345678901234567890123456789012345678901234567890') asInteger = 16rD5976F79D83D3A0DC9806C3C66F3EFD8.! !

