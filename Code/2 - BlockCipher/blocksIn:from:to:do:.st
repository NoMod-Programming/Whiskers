
!BlockCipher methodsFor: 'private' stamp: 'cmm 3/4/2006 17:40'!
blocksIn: aByteArray from: startIndex to: endIndex do: oneArgBlock 
	| tempBlock |
	self isStreamCipher
		ifFalse: [ self validateEndpointsFrom: startIndex to: endIndex ].
	tempBlock := ByteArray new: self blockSize.
	startIndex to: endIndex
		by: self blockSize
		do: 
			[ : startPos | 
			tempBlock 
				replaceFrom: 1
				to: (self blockSize min: aByteArray size - startPos + 1)
				with: aByteArray
				startingAt: startPos.
			oneArgBlock value: tempBlock.
			aByteArray 
				replaceFrom: startPos
				to: (startPos + self blockSize - 1 min: aByteArray size)
				with: tempBlock
				startingAt: 1]! !
