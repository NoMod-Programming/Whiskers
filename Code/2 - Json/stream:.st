
!Json methodsFor: 'accessing' stamp: 'djr 10/2/2007 22:44'!
stream: anObject
	"Set the value of stream"

	stream := anObject.
	(stream respondsTo: #reset) ifTrue: [
		stream reset.
	].
! !
