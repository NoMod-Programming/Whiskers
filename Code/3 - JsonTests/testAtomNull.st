
!JsonTests methodsFor: 'as yet unclassified' stamp: 'tonyg 8/16/2005 23:43'!
testAtomNull
	self json: 'null' equals: nil.
	self json: '  null' equals: nil.
	self json: 'null  ' equals: nil.
	self json: '  null  ' equals: nil.
! !
