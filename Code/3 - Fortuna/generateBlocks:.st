
!Fortuna methodsFor: 'private' stamp: 'cmm 2/20/2006 23:51'!
generateBlocks: anInteger
	^ ByteArray streamContents:
		[ : stream |
		anInteger timesRepeat:
			[ stream nextPutAll: ctr nextBlock ] ]! !
