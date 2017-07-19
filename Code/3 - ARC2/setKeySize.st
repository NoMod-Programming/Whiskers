

!ARC2 methodsFor: 'key' stamp: 'RJT 3/29/2007 12:31'!

setKeySize

	self T8: (self T1+7) // 8.

	self TM: (255 \\ (2 raisedTo: (8 + self T1 - (8 * self T8)))).! !

