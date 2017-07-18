
!LargePositiveInteger methodsFor: '*cryptography-core' stamp: 'cmm 2/14/2006 23:20'!
destroy
	"Wipe my bytes so that they cannot possibly be discovered."
	1 to: self size do:
		[ : x |
		self 
			digitAt: x
			put: 0 ]! !
