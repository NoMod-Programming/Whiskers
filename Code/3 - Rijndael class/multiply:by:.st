

!Rijndael class methodsFor: 'byte functions' stamp: 'len 8/21/2002 16:12'!

multiply: value1 by: value2

	(value1 = 0 or: [value2 = 0]) ifTrue: [^ 0].



	^ LogInverseTable at:

		((LogTable at: value1 + 1) + (LogTable at: value2 + 1) \\ 255 + 1)! !

