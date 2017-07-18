
!RandomPool methodsFor: 'as yet unclassified' stamp: 'len 8/28/2002 00:05'!
next
	outputStream atEnd
		ifTrue: [self stir.
				outputStream := (pool copyFrom: 1 to: pool size // 2) readStream].
	^ outputStream next! !
