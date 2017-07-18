
!CTR methodsFor: 'accessing' stamp: 'cmm 12/13/2006 20:53'!
encryptBlock: aByteArray
	| kSubI |
	kSubI := self nextBlock.
	aByteArray withIndexDo:
		[ : eachByte : x |
		aByteArray 
			at: x
			put: (eachByte bitXor: (kSubI at: x)).
		"reduce leakage"
		kSubI at: x put: 0 ]! !
