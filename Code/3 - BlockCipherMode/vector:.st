
!BlockCipherMode methodsFor: 'accessing' stamp: 'cmm 1/3/2007 21:17'!
vector: aByteArray 
	vector == aByteArray ifFalse: 
		[ "avoid leakage, shred prior vectors before disconnecting them."
		vector ifNotNil: [ vector destroy ].
		vector := aByteArray ]! !
