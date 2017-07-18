
!ASN1Stream methodsFor: 'stream - api' stamp: 'rww 3/25/2007 11:18'!
nextPutLength: size

	size <= 127 
		ifTrue: [self nextPut: size]
		ifFalse: [
			self nextPut: ((size digitLength) bitOr: 16r80).
			size digitLength to: 1 by: -1 do: [:digitIndex |
				self nextPut: (size digitAt: digitIndex)]]
! !
