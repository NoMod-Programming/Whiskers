
!CryptoHashFunctionTest methodsFor: 'hash algorithms' stamp: 'ul 3/3/2008 23:46'!
testMD5

	self assert: (MD5 hashMessage: '') asInteger = 16rD41D8CD98F00B204E9800998ECF8427E.
	self assert: (MD5 hashMessage: 'a') asInteger = 16r0CC175B9C0F1B6A831C399E269772661.
	self assert: (MD5 hashMessage: 'abc') asInteger = 16r900150983CD24FB0D6963F7D28E17F72.
	self assert: (MD5 hashMessage: 'message digest') asInteger = 16rF96B697D7CB7938D525A2F31AAF161D0.
	self assert: (MD5 hashMessage: 'abcdefghijklmnopqrstuvwxyz') asInteger = 16rC3FCD3D76192E4007DFB496CCA67E13B.
	self assert: (MD5 hashMessage: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') asInteger = 16rD174AB98D277D9F5A5611C2C9F419D9F.
	self assert: (MD5 hashMessage: '12345678901234567890123456789012345678901234567890123456789012345678901234567890') asInteger = 16r57EDF4A22BE3C955AC49DA2E2107B67A! !
