
!String methodsFor: '*cryptography-utility' stamp: 'cmm 1/27/2009 14:53'!
destroy
	1 
		to: self size
		do: 
			[ : n | 
			self 
				at: n
				put: (Character value: 0) ]! !
