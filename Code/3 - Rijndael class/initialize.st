

!Rijndael class methodsFor: 'class initialization' stamp: 'len 8/8/2002 17:52'!

initialize

	self initializeLogTable.

	self initializeLogInverseTable.

	self initializeRoundConstant.

	self initializeSubByte.

	self initializeSubByteInverse.



	self calculateTTables.

	self calculateInvTTables! !

