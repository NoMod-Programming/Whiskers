
!X520AbstractName methodsFor: 'printing' stamp: 'rww 3/28/2007 14:19'!
printOn: stream

	stream nextPutAll: self displayName.
	stream nextPutAll: ' = '.
	self string printOn: stream.
! !
